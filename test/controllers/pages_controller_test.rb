require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get corporativos" do
    get pages_corporativos_url
    assert_response :success
  end

end
