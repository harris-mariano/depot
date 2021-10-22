require 'rails_helper'

RSpec.describe "OrdersControllers", type: :request do
  fixtures :orders

  before(:each) do
    @order = orders(:one)

    login_user
  end

  def order_params
    { order: { name:@order.name, address: @order.address, email: @order.email, pay_type: @order.pay_type } }
  end

  # def authorize
  #   expect_any_instance_of(OrdersController).to receive(:authorize).and_return(true)
  # end

  it 'should get index' do
    # authorize
    get orders_url
    expect(response).to be_success
  end

  it "should require item in cart" do
    get new_order_url
    expect(response).to redirect_to(store_index_path)
    expect(flash[:notice]).to eq('Your cart is empty')
  end

  it 'should create order' do
    post orders_url, params: order_params
    expect(response).to redirect_to(store_index_url(locale: 'en'))
  end

  it 'should get edit' do
    # authorize
    get edit_order_url(@order)
    expect(response).to be_success
  end

  it 'should update order' do
    # authorize
    patch order_url(@order), params: order_params
    expect(response).to redirect_to(@order)
  end

  it 'should destroy order' do
    # authorize
    delete order_url(@order)

    expect(response).to redirect_to(orders_url)
  end
end
