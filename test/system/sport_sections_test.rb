require "application_system_test_case"

class SportSectionsTest < ApplicationSystemTestCase
  setup do
    @sport_section = sport_sections(:one)
  end

  test "visiting the index" do
    visit sport_sections_url
    assert_selector "h1", text: "Sport Sections"
  end

  test "creating a Sport section" do
    visit sport_sections_url
    click_on "New Sport Section"

    fill_in "Coach Name", with: @sport_section.coach_name
    fill_in "Description", with: @sport_section.description
    fill_in "Name", with: @sport_section.name
    click_on "Create Sport section"

    assert_text "Sport section was successfully created"
    click_on "Back"
  end

  test "updating a Sport section" do
    visit sport_sections_url
    click_on "Edit", match: :first

    fill_in "Coach Name", with: @sport_section.coach_name
    fill_in "Description", with: @sport_section.description
    fill_in "Name", with: @sport_section.name
    click_on "Update Sport section"

    assert_text "Sport section was successfully updated"
    click_on "Back"
  end

  test "destroying a Sport section" do
    visit sport_sections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sport section was successfully destroyed"
  end
end
