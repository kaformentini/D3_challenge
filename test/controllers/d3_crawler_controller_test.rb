require 'test_helper'

class D3CrawlerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get d3_crawler_index_url
    assert_response :success
  end

end
