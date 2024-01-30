class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_params, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if @item.order.present?
      redirect_to root_path
    else
      return if current_user != @item.user

      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def item_params
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
