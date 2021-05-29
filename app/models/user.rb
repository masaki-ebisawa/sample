class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
                       length: { maximum: 15 },
                       
  validates :email, presence: true,
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                       format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  
  VALID_PASSWORD_REGEX = /\A[\w\-]{8,32}+\z/i
  validates :password, presence: true,
                       length: { minimum: 8, maximum: 32 },
                       format: {
                         with: VALID_PASSWORD_REGEX
                       },
                       allow_nil: true
  
  validates :encrypted_password,:password,:password_confirmation,
                       length:{minimum: 8, maximum: 32 },
                       format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
end