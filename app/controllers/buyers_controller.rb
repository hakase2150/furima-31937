class BuyersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :redirect_root, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @user_buyer = UserBuyer.new
  end

  def create
    @user_buyer = UserBuyer.new(buyer_params)
    if @user_buyer.valid?
      pay_item
      @user_buyer.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buyer_params
    params.require(:user_buyer).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
  end

  def redirect_root
    if current_user.id == @item.user_id || @item.buyer != nil
      redirect_to root_path
    end
  end

end