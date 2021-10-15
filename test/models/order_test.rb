require 'application_system_test_case'

class OrderTest < ApplicationSystemTestCase
  test "check routing number" do
    visit store_index_url

    first(".catalog li").click_on 'Add to Cart'

    click_on 'Checkoout'

    fill_in "name",	with: "Harris" 
    fill_in "address",	with: "Manila" 
    fill_in "email",	with: "harris@test.com" 

    assert_no_selector "#order_routing_number"

    select "Check", from: 'pay_type'

    assert_selector "#order_routing_number"
  end
end
