class User < ApplicationRecord
    has_many :posts
    has_many :posts, dependent: :destroy
    has_many :comments
    has_many :comments, dependent: :destroy
 
    VALID_PASSWORD_REGEX = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/i
    VALID_USERNAME_REGEX = /\A[a-zA-Z\d\w-]+\z/i
    
    validates :username, presence: true, length: { minimum: 2, maximum: 15 },
    uniqueness: { case_sensitive: false, message: "username is taken" },
    format: { with: VALID_USERNAME_REGEX }
    
    validates :password, presence: true, length: { minimum: 10, maximum: 255 },
    format: { with: VALID_PASSWORD_REGEX,  message: "must contain at least one uppercase letter, one special character, one number and one lowercase letter"}
    
    has_secure_password
    
    #needed for test
    def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
