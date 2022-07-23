class ItemsController < ApplicationController
  before_action :authenticate_user!, {except: [:index, :show]}
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    if user_signed_in?
       @item = Item.new
    else
       redirect_to user_session_path(@item.id)
    end
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
    @item = Item.find(params[:id])
  end

  



  private

 
  def item_params
    params.require(:item).permit(:item_name, :introduction, :price, :delivery_days_id, :item_condition_id, :postage_payer_id, :prefecture_code_id, :category_id, :image).merge(user_id: current_user.id)
  end

 
end
