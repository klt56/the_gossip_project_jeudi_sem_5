class User < ApplicationRecord
    validates :mail, uniqueness: true
  validates :mail, presence: true
  validates :password, length: { minimum: 5, allow_nil: true }
  has_many :posts
  has_many :comments
  has_many :likes
    belongs_to :city
    has_many :gossips

    def password
        @password
      end

      def password=(raw)
        @password = raw
        self.password_digest = BCrypt::Password.create(raw)
      end
      
      def is_password?(raw)
        BCrypt::Password.new(password_digest).is_password?(raw)
      end
    
end
