class ManagementsController < ApplicationController
  before_action :set_item, only: [:index, :create, :move_to_index, :pay_item]
  before_action :move_to_index
  before_action :move_to_top

  def index
    @management = ManagementAddress.new
  end

  def create
    @management = ManagementAddress.new(management_params)
    if @management.valid?
      pay_item
      @management.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def management_params
    params.require(:management_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if @item.management
  end

  def move_to_top
    redirect_to root_path unless user_signed_in? && current_user.id != @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
