class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_furima, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]

  


  def index
    @purchase_sending = PurchaseSending.new
  end

  def create
    @purchase_sending = PurchaseSending.new(purchase_history_params)
    if @purchase_sending.valid?
      pay_item
      @purchase_sending.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_sending).permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 価格
      card: purchase_history_params[:token],  # ストロングパラメーター内のtokenを指定
      currency: 'jpy'
    )
  end

  def set_furima
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    redirect_to root_path if @item.user_id == current_user.id || !@item.purchase_history.nil?
  end
end
