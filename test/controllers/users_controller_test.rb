require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { city: @user.city, company_mailing_address: @user.company_mailing_address, company_name: @user.company_name, company_phone_number: @user.company_phone_number, company_type: @user.company_type, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password: @user.password, state: @user.state, user_name: @user.user_name, zip: @user.zip } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { city: @user.city, company_mailing_address: @user.company_mailing_address, company_name: @user.company_name, company_phone_number: @user.company_phone_number, company_type: @user.company_type, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password: @user.password, state: @user.state, user_name: @user.user_name, zip: @user.zip } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
