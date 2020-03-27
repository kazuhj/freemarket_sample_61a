class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  
  def index
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
    # あとで該当するカテゴリーを持つ商品のみを一覧ページに表示
    @items = Item.all.includes(:images)
    category_check(@category)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_check(cat)
    anc = cat.ancestry
    match_id = []
    if anc.blank?
      anc_set = "^#{cat.id}/"
      reg = Regexp.new(anc_set)
      not_null_categories = Category.where.not("ancestry IS NULL")
      not_null_categories.each do |c|
        if c[:ancestry].match(reg)
          match_id << c.id
        end
      end
      @items = Item.where(category_id: match_id).order("id DESC")
    elsif anc.match(/\//)
      @items = Item.where(category_id: cat.id).order("id DESC")
    else
      parent = anc
      child = cat.id
      anc_set = "#{parent}/#{child}"
      Category.all.each do |c|
        if c[:ancestry] == anc_set
          match_id << c.id
        end
      end
      @items = Item.where(category_id: match_id).order("id DESC")
    end
  end
end
