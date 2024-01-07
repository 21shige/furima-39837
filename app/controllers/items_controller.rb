class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :price, :image, :category_id, :condition_id, :cost_burden_id,
                                 :prefecture_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end
