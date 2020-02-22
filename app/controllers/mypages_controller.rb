class MypagesController < ApplicationController

  def index
  end

  def identification
    @address = Prefecture.all
  end

  def profile
  end

  def card
  end
  
end
