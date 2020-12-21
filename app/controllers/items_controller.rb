class ItemsController < ApplicationController
  before_action :move_to_log_in, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.valid?
    if Item.create(items_params).valid?
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

  def move_to_log_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def items_params
    params.require(:item).permit(:name,:description,:category_id,:condition_id,:prefecture_id,:shipping_payer_id,:shipping_duration_id,:image,:price).merge(user_id: current_user.id)
  end

end
