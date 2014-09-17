require 'test_helper'

class FirstSemesterCourseVideoTutorialControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
