require "application_system_test_case"

class SportSectionsUsersTest < ApplicationSystemTestCase
  setup do
    @sport_sections_user = sport_sections_users(:one)
  end

  test "visiting the index" do
    visit sport_sections_users_url
    assert_selector "h1", text: "Sport Sections Users"
  end

  test "creating a Sport sections user" do
    visit sport_sections_users_url
    click_on "New Sport Sections User"

    click_on "Create Sport sections user"

    assert_text "Sport sections user was successfully created"
    click_on "Back"
  end

  test "updating a Sport sections user" do
    visit sport_sections_users_url
    click_on "Edit", match: :first

    click_on "Update Sport sections user"

    assert_text "Sport sections user was successfully updated"
    click_on "Back"
  end

  test "destroying a Sport sections user" do
    visit sport_sections_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sport sections user was successfully destroyed"
  end
end
