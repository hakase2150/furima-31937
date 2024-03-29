class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :redirect_root, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
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

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :state_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def redirect_root
    if @item.buyer != nil
      redirect_to root_path
    end
  end

end
