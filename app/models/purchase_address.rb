class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address1, :address2, :telephone

  # バリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: '郵便番号をハイフン込みで半角数字入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: '選択していない項目があります' }
    validates :city
    validates :address1
    validates :telephone, length: { maximum: 11, message: '電話番号を半角数字のみ(ハイフン無し)11桁以内で入力してください' },
                          format: { with: /\A[0-9]+\z/, message: '電話番号を半角数字のみ(ハイフン無し)11桁以内で入力してください' }
    validates :user_id
    validates :item_id
    validates :token, presence: { message: 'クレジットカード情報が間違っています' }
  end

  # 各テーブのデータ保存処理
  def save
    # 購入の情報を保存
    # user_id = current_user.id
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2,
                   telephone: telephone, purchase_id: purchase.id)
  end
end
