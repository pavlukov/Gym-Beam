require "application_system_test_case"

class TicketsUsersTest < ApplicationSystemTestCase
  setup do
    @tickets_user = tickets_users(:one)
  end

  test "visiting the index" do
    visit tickets_users_url
    assert_selector "h1", text: "Tickets Users"
  end

  test "creating a Tickets user" do
    visit tickets_users_url
    click_on "New Tickets User"

    click_on "Create Tickets user"

    assert_text "Tickets user was successfully created"
    click_on "Back"
  end

  test "updating a Tickets user" do
    visit tickets_users_url
    click_on "Edit", match: :first

    click_on "Update Tickets user"

    assert_text "Tickets user was successfully updated"
    click_on "Back"
  end

  test "destroying a Tickets user" do
    visit tickets_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tickets user was successfully destroyed"
  end
end
