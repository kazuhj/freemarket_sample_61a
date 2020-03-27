class ItemsController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:show, :show_mine, :item_stop, :item_state, :item_buy, :confirmation, :destroy, :edit, :update, :pay, :complete]
  before_action :set_address, only: [:confirmation, :complete]
  before_action :set_user, only: [:confirmation, :complete]
  before_action :set_card, only: [:pay, :confirmation, :complete]
  before_action :set_image, only: [:show, :show_mine, :confirmation, :complete]

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
    # @images = @item.images
    # @image = @images.first
    @items = Item.where(user_id: @item.user_id).order("created_at DESC").limit(6)
  end

  def show_mine
    @seller = User.find(@item.user_id)
    # @images = @item.images
    # @image = @images.first
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
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      render :confirmation
      # redirect_to confirmation_items_path
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def complete
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def destroy
    if @item.destroy
      redirect_to listing_users_path
    else
      render :show_mine
    end
  end

  def edit
  end

  def update
    if @item.update(update_item_params)
      redirect_to show_mine_items_path(@item)
    else
      render :edit
    end
  end

   def pay
   if
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
    Payjp::Charge.create(
    amount: @item.price, # 商品の値段を取り出して決済する
    customer: @card.customer_id, # DBに保存されたcustomer_idの情報を使用して決済する
    card: params['payjp-token'],
    currency: 'jpy'
  )
    redirect_to item_buy_items_path(id: @item.id), notice: '購入が完了しました'
   else
    flash.now[:alert] = '購入に失敗しました'
    render action: :confirmation
   end
end

  private

  def item_params
    params.require(:item).permit(:name, :text, :condition, :price, :fee_burden, :service, :area, :handing_time, :category, :sales_status, [images_attributes: [:image]]).merge(user_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(:name, :text, :condition, :price, :fee_burden, :service, :area, :handing_time, :category, :sales_status, [images_attributes: [:image, :_destroy, :id]]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_image
    @images = @item.images
    @image = @images.first
  end
end
