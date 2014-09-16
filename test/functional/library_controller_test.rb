require 'test_helper'

class LibraryControllerTest < ActionController::TestCase
  test "should get books" do
    get :books
    assert_response :success
  end

end
