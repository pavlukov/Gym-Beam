require 'test_helper'

class TicketsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tickets_user = tickets_users(:one)
  end

  test "should get index" do
    get tickets_users_url
    assert_response :success
  end

  test "should get new" do
    get new_tickets_user_url
    assert_response :success
  end

  test "should create tickets_user" do
    assert_difference('TicketsUser.count') do
      post tickets_users_url, params: { tickets_user: {  } }
    end

    assert_redirected_to tickets_user_url(TicketsUser.last)
  end

  test "should show tickets_user" do
    get tickets_user_url(@tickets_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_tickets_user_url(@tickets_user)
    assert_response :success
  end

  test "should update tickets_user" do
    patch tickets_user_url(@tickets_user), params: { tickets_user: {  } }
    assert_redirected_to tickets_user_url(@tickets_user)
  end

  test "should destroy tickets_user" do
    assert_difference('TicketsUser.count', -1) do
      delete tickets_user_url(@tickets_user)
    end

    assert_redirected_to tickets_users_url
  end
end
