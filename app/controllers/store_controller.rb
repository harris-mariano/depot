class StoreController < ApplicationController
  include CurrentCart
  skip_before_action :authenticate_user!
  before_action :set_cart
  before_action :count_session_visit

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
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
