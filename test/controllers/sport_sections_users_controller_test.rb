require 'test_helper'

class SportSectionsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sport_sections_user = sport_sections_users(:one)
  end

  test "should get index" do
    get sport_sections_users_url
    assert_response :success
  end

  test "should get new" do
    get new_sport_sections_user_url
    assert_response :success
  end

  test "should create sport_sections_user" do
    assert_difference('SportSectionsUser.count') do
      post sport_sections_users_url, params: { sport_sections_user: {  } }
    end

    assert_redirected_to sport_sections_user_url(SportSectionsUser.last)
  end

  test "should show sport_sections_user" do
    get sport_sections_user_url(@sport_sections_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_sport_sections_user_url(@sport_sections_user)
    assert_response :success
  end

  test "should update sport_sections_user" do
    patch sport_sections_user_url(@sport_sections_user), params: { sport_sections_user: {  } }
    assert_redirected_to sport_sections_user_url(@sport_sections_user)
  end

  test "should destroy sport_sections_user" do
    assert_difference('SportSectionsUser.count', -1) do
      delete sport_sections_user_url(@sport_sections_user)
    end

    assert_redirected_to sport_sections_users_url
  end
end
