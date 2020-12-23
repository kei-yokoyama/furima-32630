class ItemsController < ApplicationController
  before_action :move_to_log_in, except: [:index, :show]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
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
    @item = Item.find(params[:id])
  end

  private

  def move_to_log_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def items_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :prefecture_id, :shipping_payer_id,
                                 :shipping_duration_id, :image, :price).merge(user_id: current_user.id)
  end
end
