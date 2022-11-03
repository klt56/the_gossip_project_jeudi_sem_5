class CommentsController < ApplicationController
    def create
       # Créer un nouveau comment
        # pour le message du current_user
        @comment = current_user.comments.new(comment_params)
        if @comment.save
          # Envoyer un e-mail au message d'origine author
          post_author = @comment.post.user
          if post_author != @comment.user
            CommentMailer.new_comment(post_author, @comment).deliver_now
          end
    
          # S'il s'agit d'une réponse, envoyez un e-mail à l'OC author.
          if !@comment.parent.nil?
            parent_comment_author = @comment.parent.user
            if parent_comment_author != @comment.user
              CommentMailer.new_comment(parent_comment_author, @comment).deliver_now
            end
          end
        else
          flash[:notice] = @comment.errors.full_messages.to_sentence
        end
    
        redirect_to post_path(params[:post_id])
      end
    
      private
    
      def comment_params
        params
          .require(:comment)
          .permit(:content, :parent_id)
          .merge(post_id: params[:post_id])
      end
    
    end
