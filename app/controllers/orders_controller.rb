class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: :index
  
  def index
   @orderaddress = OrderAddress.new
     if current_user == @item.user || @item.order != nil
      redirect_to root_path
 
    end
  end

  def new
  end

  def create
    @orderaddress = OrderAddress.new(orderaddress_params)
    if @orderaddress.valid?
      pay_item
      @orderaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def orderaddress_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :lot_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: orderaddress_params[:token],
      currency: 'jpy'
    )
  end
end
