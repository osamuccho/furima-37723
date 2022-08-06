class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, { except: [:index, :show] }
  before_action :user_login, only: [:edit, :destroy]
  def index
    @items = Item.order('created_at DESC')

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
  end

  def edit
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy

    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
 end

  private

  def item_params
    params.require(:item).permit(:item_name, :introduction, :price, :delivery_days_id, :item_condition_id, :postage_payer_id,
                                 :prefecture_code_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_login
    redirect_to root_path unless current_user.id == @item.user_id
  end


end
