class MypagesController < ApplicationController

  def index
  end

  def identification
    @address = Prefecture.all
  end

end
