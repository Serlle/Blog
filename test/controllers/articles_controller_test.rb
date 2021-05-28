require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index_pag_web" do
    get articles_index_pag_web_url
    assert_response :success
  end
end
