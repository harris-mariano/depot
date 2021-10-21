require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  fixtures :users

  before(:each) do
    # expect_any_instance_of(UsersController).to receive(:authorize).and_return(true)
    login_user
    @user = users(:one)
  end

  def user_params
    { user: { name: 'Sam', password: 'secret' } }
  end

  it "should get index" do
    get users_url
    expect(response).to be_success
  end

  it "should get new" do
    get new_user_url
    expect(response).to be_success
  end

  it "should create user" do
    post users_url, params: user_params
    expect(response).to redirect_to(authenticated_root_url)
  end

  it "should get edit" do
    get edit_user_url(@user)
    expect(response).to be_success
  end

  it "should update user" do
    patch user_url(@user), params: user_params
    expect(response).to redirect_to(users_url)
  end

  it "should destroy user" do
    delete user_url(@user)
    expect(response).to redirect_to(users_url)
  end
end
