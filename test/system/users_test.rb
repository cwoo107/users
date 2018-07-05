require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "City", with: @user.city
    fill_in "Company Mailing Address", with: @user.company_mailing_address
    fill_in "Company Name", with: @user.company_name
    fill_in "Company Phone Number", with: @user.company_phone_number
    fill_in "Company Type", with: @user.company_type
    fill_in "Email", with: @user.email
    fill_in "First Name", with: @user.first_name
    fill_in "Last Name", with: @user.last_name
    fill_in "Password", with: @user.password
    fill_in "State", with: @user.state
    fill_in "User Name", with: @user.user_name
    fill_in "Zip", with: @user.zip
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "City", with: @user.city
    fill_in "Company Mailing Address", with: @user.company_mailing_address
    fill_in "Company Name", with: @user.company_name
    fill_in "Company Phone Number", with: @user.company_phone_number
    fill_in "Company Type", with: @user.company_type
    fill_in "Email", with: @user.email
    fill_in "First Name", with: @user.first_name
    fill_in "Last Name", with: @user.last_name
    fill_in "Password", with: @user.password
    fill_in "State", with: @user.state
    fill_in "User Name", with: @user.user_name
    fill_in "Zip", with: @user.zip
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end