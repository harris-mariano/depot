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
    # get login_url
    get new_user_session_url
    expect(response).to be_success
  end

  # it 'should fail login' do
  #   # post login_url, params: { name: @user.name, password: 'wrong' }
  #   sign_in User.create(email: 'test@test.com', password: '')
  #   # expect(response).to redirect_to(login_url)
  #   expect(response).to redirect_to(new_user_session_url)
  # end

  # it 'should login' do
  #   # post login_url, params: login_params
  #   login_user
  #   # expect(response).to redirect_to(admin_url)
  #   expect(response).to redirect_to(authenticated_root_url)
  #   # expect(@user.id).to eq(session[:user_id])
  #   expect(current_user).to eq(session[:user_id])
  # end

  it 'should logout' do
    delete destroy_user_session_url
    expect(response).to redirect_to(store_index_url)
  end
end
