require 'rails_helper'

RSpec.describe "AdminControllers", type: :request do
  before :each do
    # expect_any_instance_of(AdminController).to receive(:authorize).and_return(true)

    login_user
  end

  it 'should get index' do
    # get admin_url
    get authenticated_root_url
    expect(response).to be_success
  end
  
end
