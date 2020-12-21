class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40, message: '40文字以内にしてください' }
    validates :description, length: { maximum: 1000, message: '1000文字以内にしてください' }
    validates :category
    validates :condition
    validates :prefecture
    validates :shipping_duration
    validates :shipping_payer
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '(金額)を¥300 ~ 9,999,999 内で半角数字入力してください' }, format: { with: /\A[0-9]+\z/ }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_duration
  belongs_to :shipping_payer
  has_one_attached :image
  belongs_to :user
end
