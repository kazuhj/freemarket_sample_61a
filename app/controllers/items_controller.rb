class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :show_mine, :item_stop, :item_state, :item_buy, :confirmation, :destroy, :edit, :update]
  before_action :set_user, only: [:confirmation]

  def index
    @categories = [ Category.find_by(category:"レディース"),
                    Category.find_by(category:"メンズ"),
                    Category.find_by(category:"家電・スマホ・カメラ"),
                    Category.find_by(category:"おもちゃ・ホビー・グッズ")]
  end

  def new
    @address = Prefecture.all
    @item = Item.new
    @images = @item.images.build
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.category
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.category
    end
    if @item.save
      redirect_to mypages_path
    else
      render :new
    end
  end

  def show
    @images = @item.images
    @image = @images.first
    @items = Item.where(user_id: @item.user_id).order("created_at DESC").limit(6)
  end
  

  def show_mine
    @seller = User.find(@item.user_id)
    @images = @item.images
    @image = @images.first
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

  def edit
    # @category_parent_array = ["---"]
    # #データベースから、親カテゴリーのみ抽出し、配列化
    # Category.where(ancestry: nil).each do |parent|
    # @category_parent_array << parent.category
    # end
    @parents = Category.where(ancestry:nil)
    @category_grandchildren_now = Category.find(@item.category_id)
    @category_children_now = @category_grandchildren_now.parent
    @category_parent_now = @category_children_now.parent
    @p_c_children = @category_parent_now.children
    @c_grandchildren_children = @category_children_now.children
    # @parents = Category.where(ancestry:nil)
    # # 編集する商品を選択
    # @item = Item.find(params[:id])
    # # 登録されている商品の孫カテゴリーのレコードを取得
    # @selected_grandchild_category = @item.category
    # # 孫カテゴリー選択肢用の配列作成
    # @category_grandchildren_array = [{id: "---", name: "#{@item.category}"}]
    # Category.find("#{@selected_grandchild_category.id}").siblings.each do |grandchild|
    #   grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.category}"}
    #   @category_grandchildren_array << grandchildren_hash
    # end
    # # 選択されている子カテゴリーのレコードを取得
    # @selected_child_category = @selected_grandchild_category.parent
    # # 子カテゴリー選択肢用の配列作成
    # @category_children_array = [{id: "---", name: "---"}]
    # Category.find("#{@selected_child_category.id}").siblings.each do |child|
    #   children_hash = {id: "#{child.id}", name: "#{child.category}"}
    #   @category_children_array << children_hash
    # end
    # # 選択されている親カテゴリーのレコードを取得
    # @selected_parent_category = @selected_child_category.parent
    # # 親カテゴリー選択肢用の配列作成
    # @category_parents_array = [{id: "---", name: "---"}]
    # Category.find("#{@selected_parent_category.id}").siblings.each do |parent|
    #   parent_hash = {id: "#{parent.id}", name: "#{parent.category}"}
    #   @category_parents_array << parent_hash
    # end
  end

  def update
    
    if @item.update(update_item_params)
      redirect_to show_mine_items_path(@item)
    else
      render :edit
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children 
    #@category_children = Category.find_by(category: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children 
    #@category_grandchildren = Category.find("#{params[:child_id]}").children
  end 



  private

  def item_params
    params.require(:item).permit(:name, :text, :condition, :price, :fee_burden, :service, :area, :handing_time, :category_id, :sales_status, [images_attributes: [:image]]).merge(user_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(:name, :text, :condition, :price, :fee_burden, :service, :area, :handing_time, :category_id, :sales_status, [images_attributes: [:image, :_destroy, :id]]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
