require 'rails_helper'

RSpec.describe "LineItemsControllers", type: :request do
  fixtures :line_items
  fixtures :products

  before :each do
    @line_item = line_items(:one)
    @product = products(:ruby)

    login_user
  end

  # def authorize
  #   expect_any_instance_of(LineItemsController).to receive(:authorize).and_return(true)
  # end

  it 'should get index' do
    # authorize
    get line_items_url
    expect(response).to be_success
  end

  it 'should get new' do
    # authorize
    get new_line_item_url
    expect(response).to be_success
  end

  # it 'should create line item' do
  #   post line_item_url, params: { product_id: @product.id}
  # end
  
  # it 'should create line item via ajax' do
  #   post line_item_url, params: { product_id: @product.id}, xhr: true
  #   expect(response).to be_success
  #   expect(/<tr class=\\"line-item-highlight/).to match(response.body)
  # end

  it 'should get edit' do
    # authorize
    get edit_line_item_url(@line_item)
    expect(response).to be_success
  end

  it 'should update line item' do
    # authorize
    patch line_item_url(@line_item), params: { line_item: { product_id: @line_item.product_id } }
    expect(response).to redirect_to(@line_item)
  end

  it 'should show line item' do
    # authorize
    get line_item_url(@line_item)
    expect(response).to be_success
  end

  it 'should destroy line item' do
    # authorize
    delete line_item_url(@line_item)
    expect(response).to redirect_to(line_items_url)
  end
end
