class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_log_in
  before_action :move_to_root_path

  def index
    @purchase_address = PurchaseAddress.new
  end

  def new
    @purchase_address = PurchaseAddress.new(purchase_address_params)
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :telephone, :purchase_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end

  def move_to_log_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
