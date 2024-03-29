class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :buyers

  with_options presence:true do
    validates :nickname
    validates :email
    validates :birthday

      with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' } do
        validates :last_name 
        validates :first_name
      end
      
      with_options format: { with: /\A[ァ-ヶ]+\z/, message: 'には全角カタカナを使用してください' } do
        validates :last_name_kana
        validates :first_name_kana
      end

      with_options uniqueness: { case_sensitive: true } do
        validates :email
      end
    
      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
      validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と数字の両方を含めて設定してください'
  end
end