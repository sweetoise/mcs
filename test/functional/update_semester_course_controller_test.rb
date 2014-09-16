require 'test_helper'

class UpdateSemesterCourseControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
