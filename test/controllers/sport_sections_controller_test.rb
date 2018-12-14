require 'test_helper'

class SportSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sport_section = sport_sections(:one)
  end

  test "should get index" do
    get sport_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_sport_section_url
    assert_response :success
  end

  test "should create sport_section" do
    assert_difference('SportSection.count') do
      post sport_sections_url, params: { sport_section: { coach_name: @sport_section.coach_name, description: @sport_section.description, name: @sport_section.name } }
    end

    assert_redirected_to sport_section_url(SportSection.last)
  end

  test "should show sport_section" do
    get sport_section_url(@sport_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_sport_section_url(@sport_section)
    assert_response :success
  end

  test "should update sport_section" do
    patch sport_section_url(@sport_section), params: { sport_section: { coach_name: @sport_section.coach_name, description: @sport_section.description, name: @sport_section.name } }
    assert_redirected_to sport_section_url(@sport_section)
  end

  test "should destroy sport_section" do
    assert_difference('SportSection.count', -1) do
      delete sport_section_url(@sport_section)
    end

    assert_redirected_to sport_sections_url
  end
end
