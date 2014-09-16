require 'test_helper'

class InstitutionAdsControllerTest < ActionController::TestCase
  setup do
    @institution_ad = institution_ads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:institution_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create institution_ad" do
    assert_difference('InstitutionAd.count') do
      post :create, institution_ad: { address: @institution_ad.address, content: @institution_ad.content, email: @institution_ad.email, institution_id: @institution_ad.institution_id, name: @institution_ad.name, price: @institution_ad.price, website: @institution_ad.website }
    end

    assert_redirected_to institution_ad_path(assigns(:institution_ad))
  end

  test "should show institution_ad" do
    get :show, id: @institution_ad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @institution_ad
    assert_response :success
  end

  test "should update institution_ad" do
    put :update, id: @institution_ad, institution_ad: { address: @institution_ad.address, content: @institution_ad.content, email: @institution_ad.email, institution_id: @institution_ad.institution_id, name: @institution_ad.name, price: @institution_ad.price, website: @institution_ad.website }
    assert_redirected_to institution_ad_path(assigns(:institution_ad))
  end

  test "should destroy institution_ad" do
    assert_difference('InstitutionAd.count', -1) do
      delete :destroy, id: @institution_ad
    end

    assert_redirected_to institution_ads_path
  end
end
