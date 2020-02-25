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

  def card_create
  end
end
