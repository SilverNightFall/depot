require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    # Verfies a min of 4 elements
    assert_select '#columns #side a', minimum: 4
    # Verifies 3 elements
    assert_select '#main .entry', 3
    # Verfies h3 title
    assert_select 'h3', 'Programming Ruby 1.9'
    # Verifies the price is in the right form
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
