require 'test_helper'

class FacultyAdsControllerTest < ActionController::TestCase
  setup do
    @faculty_ad = faculty_ads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faculty_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faculty_ad" do
    assert_difference('FacultyAd.count') do
      post :create, faculty_ad: { address: @faculty_ad.address, content: @faculty_ad.content, email: @faculty_ad.email, faculty_id: @faculty_ad.faculty_id, name: @faculty_ad.name, price: @faculty_ad.price, website: @faculty_ad.website }
    end

    assert_redirected_to faculty_ad_path(assigns(:faculty_ad))
  end

  test "should show faculty_ad" do
    get :show, id: @faculty_ad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faculty_ad
    assert_response :success
  end

  test "should update faculty_ad" do
    put :update, id: @faculty_ad, faculty_ad: { address: @faculty_ad.address, content: @faculty_ad.content, email: @faculty_ad.email, faculty_id: @faculty_ad.faculty_id, name: @faculty_ad.name, price: @faculty_ad.price, website: @faculty_ad.website }
    assert_redirected_to faculty_ad_path(assigns(:faculty_ad))
  end

  test "should destroy faculty_ad" do
    assert_difference('FacultyAd.count', -1) do
      delete :destroy, id: @faculty_ad
    end

    assert_redirected_to faculty_ads_path
  end
end
