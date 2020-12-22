class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '英語、数字 それぞれ1文字以上を半角入力してください' }
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '漢字、全角ひらがな、全角カタカナ を入力してください' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: '全角カタカナ を入力してください' } do
      validates :family_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end

  has_many :items
end
