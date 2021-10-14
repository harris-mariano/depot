class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :count_session_visit

  def index
    @products = Product.order(:title)
  end

  private

  def count_session_visit
    if session[:counter].nil?
      session[:counter] = 0
    else
      session[:counter] += 1
    end
  end
end
