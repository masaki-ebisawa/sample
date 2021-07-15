class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
                       length: { maximum: 15 }
  
  EMAIL_REGEX = /[a-z0-9._+]+@[a-z0-9-]+\.[a-z0-9-]+.*/i  #字セット[]で指定可能な文字列のセットを作り、その文字の任意の一文字という意味の[]+を＠マークとドットの前後に並べてます。
                                                          #最後の文字列はなんでもいいので.*を指定してます。
                                                          #最後のiは大文字と小文字を区別しないというオプションです。
  validates :email, presence: true, 
                       format: { with: EMAIL_REGEX }

  has_secure_password
  
  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i   #半角英字と半角数字それぞれ1文字以上含む8文字以上32文字以下の文字列
  validates :password, presence: true,
                       length: { minimum: 8, maximum: 32 },
                       format: {
                         with: PW_REGEX
                       },
                       allow_nil: true
  
  validates :password,:password_confirmation,
                       length:{minimum: 8, maximum: 32 },
                       format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i}   #半角英字と半角数字それぞれ1文字以上含む8文字以上32文字以下の文字列

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  

end