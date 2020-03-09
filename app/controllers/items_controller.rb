class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

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

  def confirmation
  end

  def complete
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :condition, :price, :fee_burden, :service, :area, :handing_time, :category, :sales_status, [images_attributes: [:image]])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
