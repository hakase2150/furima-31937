class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と数字の両方を含めて設定してください'
  
  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
  end
  
  with_options presence: true do
    validates :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: 'には全角カタカナを使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: 'には全角カタカナを使用してください' }
  end
  
  validates :birthday, presence: true
end
