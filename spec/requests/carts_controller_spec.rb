require 'rails_helper'

RSpec.describe "CartsControllers", type: :request do
  fixtures :carts
  fixtures :products

  before :each do
    @cart = carts(:one)
     login_user
  end

  # def authorize
  #   expect_any_instance_of(CartsController).to receive(:authorize).and_return(true)
  # end

  def cart_params
    { cart: {  } }
  end

  it 'should get index' do
    # authorize
    get carts_url
    expect(response).to be_success
  end

  it 'should get new' do
    # authorize
    get new_cart_url
    expect(response).to be_success
  end

  it 'should create cart' do
    post carts_url, params: cart_params
    expect(response).to redirect_to(Cart.last)
  end

  it 'should get edit' do
    # authorize
    get cart_url(@cart)
    expect(response).to be_success
  end

  it 'should update cart' do
    patch cart_url(@cart), params: cart_params
    expect(response).to redirect_to(@cart)
  end

  it 'should destroy cart' do
    # authorize
    post line_items_url, params: { product_id: products(:ruby).id }
    @cart = Cart.find(session[:cart_id]) 

    delete cart_url(@cart)
    expect(response).to redirect_to(store_index_url)
  end
end
