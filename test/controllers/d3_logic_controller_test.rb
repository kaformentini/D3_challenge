require 'test_helper'

class D3LogicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get d3_logic_index_url
    assert_response :success
  end

end
