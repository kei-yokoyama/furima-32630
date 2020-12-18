class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英語、数字 それぞれ1文字以上を入力してください' }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '漢字、全角ひらがな、全角カタカナ を入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '漢字、全角ひらがな、全角カタカナ を入力してください' }
  validates :family_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: '全角カタカナ を入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: '全角カタカナ を入力してください' }
end
