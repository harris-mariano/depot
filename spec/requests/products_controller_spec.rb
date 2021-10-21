require 'rails_helper'

RSpec.describe "ProductsControllers", type: :request do
  fixtures :products

  before(:each) do
    # expect_any_instance_of(ProductsController).to receive(:authorize).and_return(true)

    login_user
    
    @product = products(:one)
    @title = "The Great Book #{rand(1000)}"
  end

  def product_params
    { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } }
  end
  
  it "should get index" do
    get products_url
    expect(response).to be_success
  end

  it "should get new" do
    get new_product_url
    expect(response).to be_success
  end

  it "should create product" do
    post products_url, params: product_params
  end

  it "should show product" do
    get product_url(@product)
    expect(response).to be_success
  end

  it "should get edit" do
    get edit_product_url(@product)
    expect(response).to be_success
  end

  it "should update product" do
    patch product_url(@product), params: product_params
    expect(response).to redirect_to(@product)
  end

  it "should destroy product" do
    delete product_url(@product)
    expect(response).to redirect_to(products_url)
  end

  # it "should not delete product in cart" do
  #   delete product_url(products(:two))
  #   expect(response).to throw :abort
  # end
end
