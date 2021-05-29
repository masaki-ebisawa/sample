class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_secure_password
  
  VALID_PASSWORD_REGEX = /\A[\w\-]{8,32}+\z/i
  validates :password, presence: true,
                       length: { minimum: 8, maximum: 32 },
                       format: {
                         with: VALID_PASSWORD_REGEX
                       },
                       allow_nil: true
end