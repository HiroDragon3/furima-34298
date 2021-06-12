class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @item = Item.new
  end

  def new
    @items = Item.new
  end

  private

  def item_params
    params.requrire(:item).permit(:image).merge(user_id: current_user.id)
  end
end
