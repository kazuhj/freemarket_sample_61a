class ItemSellsController < ApplicationController

  def index
    @address = Prefecture.all
  end

end
