class UsersController < ApplicationController

  def index
  end

  def new
  end
  
  def tel
  end

  def address
    @address = Prefecture.all
  end

  def credit
  end

  def done
  end

  def login
  end

  # mypageの出品
  def listing
    @items = Item.where(user_id: current_user.id).order("id DESC").limit(5)
  end

  def in_progress
    @items = Item.where(user_id: current_user.id).order("id DESC").limit(5)
  end

  # mypageの売却済み
  def completed
    @items = Item.where(user_id: current_user.id).order("id DESC").limit(5)
  end

  # mypageの購入した商品
  def purchased
  end

end
