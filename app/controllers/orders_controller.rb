class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation
  before_action :sold_out

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :item_prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user.id
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end
  
end