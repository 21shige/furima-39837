class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :price, :image).merge(user_id: current_user.id)
  end
end
