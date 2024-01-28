class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @orders = Order.new
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    else
      return if current_user != @item.user
      redirect_to root_path
    end
  end


  # def index
  #   @orders = Order.new
  #   @order_address = OrderAddress.new
  #   @item = Item.find(params[:item_id])

  #   if current_user != @item.user
  #     redirect_to root_path
  #   elsif @item.order.present?
  #     redirect_to root_path
  #   else
  #     render :index
  #   end
  # end

  def create
    @item = Item.find(params[:item_id])
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

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: Item.find(order_params[:item_id]).price,
      card: order_params[:token],   
      currency: 'jpy'                 
    )
  end

end
