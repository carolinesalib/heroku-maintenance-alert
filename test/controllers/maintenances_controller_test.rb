require "test_helper"

class MaintenancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get maintenances_index_url
    assert_response :success
  end
end
