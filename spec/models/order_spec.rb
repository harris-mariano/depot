require 'rails_helper'

RSpec.describe Order, type: :model do
  it "attributes should not be empty" do
    order = Order.new

    expect(order).to be_invalid
    expect(order.errors[:name]).to be_any
    expect(order.errors[:address]).to be_any
    expect(order.errors[:email]).to be_any
    expect(order.errors[:pay_type]).to be_any
  end
end
