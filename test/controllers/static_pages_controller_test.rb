require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get ie-compatibility" do
    get :ie-compatibility
    assert_response :success
  end

end
