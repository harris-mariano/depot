require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
include ActiveJob::TestHelper
  test "check routing number" do
    LineItem.delete_all
    Order.delete_all

    visit store_index_url

    first(".catalog li").click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in "order_name",	with: "Harris" 
    fill_in "order_address",	with: "Manila" 
    fill_in "order_email",	with: "harris@test.com" 

    assert_no_selector "#order_routing_number"

    select "Check", from: 'pay_type'

    assert_selector "#order_routing_number"

    fill_in "order_routing_number",	with: 123
    fill_in "order_account_number",	with: 456  

    perform_enqueued_jobs do
      click_button 'Place Order'
    end

    # check if record is created
    orders = Order.all
    assert_equal 1, orders.size

    order = orders.first

    assert_equal "Harris", order.name
    assert_equal "Manila", order.address
    assert_equal "harris@test.com", order.email
    assert_equal "Check", order.pay_type
    assert_equal 1, order.line_items.size

    # check if mail has been sent
    mail = ActionMailer::Base.deliveries.last

    assert_equal ["harris@test.com"], mail.to
    assert_equal 'Harris Test <harris@test.com>', mail[:from].value
    assert_equal "Pragmatic Store Order Confirmation", mail.subject

  end
end
