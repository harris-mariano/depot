require 'rails_helper'

RSpec.describe "SessionsControllers", type: :request do
  fixtures :users
  
  before :each do
    @user = users(:one)
  end

  def login_params
    { name: @user.name, password: 'secret' }
  end

  it "should prompt for login" do
    get login_url
    expect(response).to be_success
  end

  it 'should login' do
    post login_url, params: login_params
    expect(response).to redirect_to(admin_url)
    expect(@user.id).to eq(session[:user_id])
  end

  it 'should fail login' do
    post login_url, params: { name: @user.name, password: 'wrong' }
    expect(response).to redirect_to(login_url)
  end

  it 'should logout' do
    delete logout_url
    expect(response).to redirect_to(store_index_url)
  end
end
