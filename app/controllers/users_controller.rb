class UsersController < ApplicationController
  def new 
    @user = User.new 
  end
  def create
    @user = User.new(
      first_name: params[:first_name], 
      last_name: params[:last_name],
      mail: params[:mail],
      age: params[:age],
      description: params[:description],
      password_digest: params[:password_digest],
      city_id: rand(1..60)
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash.now[:notice] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:mail, :password)
  end
end
