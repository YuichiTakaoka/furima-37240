class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    # @items = Item.order("created_at DESC")
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
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :concept, :category_id, :condition_id, :delivary_fee_id, :prefecture_id, :delivary_day_id, :price).merge(user_id: current_user.id)
  end
end
