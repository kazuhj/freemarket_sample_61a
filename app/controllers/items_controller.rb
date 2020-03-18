class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :show_mine, :item_stop, :item_state, :item_buy, :confirmation, :destroy]

  def index
    @items = Item.where(sales_status:"1").order("created_at DESC").limit(10)
  end

  def new
    @address = Prefecture.all
    @item = Item.new
    @images = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to mypages_path
    else
      render :new
    end
  end

  def show
    @images = @item.images
    @image = @images.first
  end


  def show_mine
    @seller = User.find(@item.user_id)
  end

  def item_stop
    if @item.update(sales_status: "公開停止")
      redirect_to listing_users_path
    else
      render :show_mine
    end
  end

  def item_state
    if @item.update(sales_status: "出品中")
      redirect_to listing_users_path
    else
      render :show_mine
    end
  end

  def item_buy
    if @item.update(sales_status: "取引中")
      redirect_to complete_items_path
    else
      render :confirmation
    end
  end


  def confirmation
    @items = Item.where(user_id: current_user.id).order("id DESC").limit(5)
  end

  def complete
  end

  def destroy
    if @item.destroy
      redirect_to listing_users_path
    else
      render :show_mine
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :condition, :price, :fee_burden, :service, :area, :handing_time, :category, :sales_status, [images_attributes: [:image]]).merge(user_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(:name, :text, :condition, :price, :fee_burden, :service, :area, :handing_time, :category, :sales_status, [images_attributes: [:image]]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
