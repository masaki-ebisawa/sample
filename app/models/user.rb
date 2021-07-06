class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
                       length: { maximum: 15 }
  
  EMAIL_REGEX = /[a-z0-9._+]+@[a-z0-9-]+\.[a-z0-9-]+.*/i
  validates :email, presence: true, 
                       format: { with: EMAIL_REGEX }

  has_secure_password
  
  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true,
                       length: { minimum: 8, maximum: 32 },
                       format: {
                         with: PW_REGEX
                       },
                       allow_nil: true
  
  validates :encrypted_password,:password,:password_confirmation,
                       length:{minimum: 8, maximum: 32 },
                       format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i}

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through :favorites, source: 'topic'
  
  mount_uploader :image, ImageUploader

end