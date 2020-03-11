class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :confirmation, :update, :item_stop]

  def index
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
  end

  def update
    item = Item.find(params[:id])
    if item.update(update_item_params)
      redirect_to root_path
    else
      redirect_to mypages_path
    end
  end

  def show_mine
    @seller = User.find(@item.user_id)
  end

  def item_stop
    @item.update(salse_status: "停止中")
    redirect_to @item
  end


  def confirmation
  end

  def complete
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :condition, :price, :fee_burden, :service, :area, :handing_time, :category, :sales_status, [images_attributes: [:image]])
  end

  def update_item_params
    params.require(:item).permit(:name, :text, :condition, :price, :fee_burden, :service, :area, :handing_time, :category, :sales_status, [images_attributes: [:image]]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
