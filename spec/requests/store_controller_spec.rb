require 'rails_helper'

RSpec.describe "StoreControllers", type: :request do
  it "should get index" do
    page = get store_index_url
    expect(response).to be_success
    
    # response.body.should have_css('nav.side_nav a')
  end
end
