require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_event_path
    assert_response :success
  end
end
