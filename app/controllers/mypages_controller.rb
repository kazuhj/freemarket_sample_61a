class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :identification, :profile]

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

  def logout
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
