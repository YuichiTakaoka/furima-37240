class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :set_root, only: [:edit, :destroy]
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
      render :new
    end
  end

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_root
    redirect_to root_path unless @item.user_id == current_user.id
      
  end

  def move_to_index
      if current_user.id != @item.user_id || @item.order != nil
        redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :concept, :category_id, :condition_id, :delivary_fee_id, :prefecture_id,
                                 :delivary_day_id, :price).merge(user_id: current_user.id)
  end
end
