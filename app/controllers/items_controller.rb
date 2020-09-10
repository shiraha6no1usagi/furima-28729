class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :category_id, :status_id, :delivery_fee_id, :shipping_origin_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
