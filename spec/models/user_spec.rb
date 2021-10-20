require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  it "is not valid without a unique name" do
    # create_user
    user = User.new(
      name: users(:one).name,
      password: 'password',
      password_confirmation: 'password'
    )

    expect(user).to be_invalid
    expect(user.errors[:name]).to eq(["has already been taken"])
  end
end
