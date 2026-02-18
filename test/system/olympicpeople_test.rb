require "application_system_test_case"

class OlympicpeopleTest < ApplicationSystemTestCase
  setup do
    @olympicperson = olympicpeople(:one)
  end

  test "visiting the index" do
    visit olympicpeople_url
    assert_selector "h1", text: "Olympicpeople"
  end

  test "creating a Olympicperson" do
    visit olympicpeople_url
    click_on "New Olympicperson"

    fill_in "Otherperson", with: @olympicperson.otherperson_id
    fill_in "Person", with: @olympicperson.person_id
    fill_in "Skill", with: @olympicperson.skill_id
    click_on "Create Olympicperson"

    assert_text "Olympicperson was successfully created"
    click_on "Back"
  end

  test "updating a Olympicperson" do
    visit olympicpeople_url
    click_on "Edit", match: :first

    fill_in "Otherperson", with: @olympicperson.otherperson_id
    fill_in "Person", with: @olympicperson.person_id
    fill_in "Skill", with: @olympicperson.skill_id
    click_on "Update Olympicperson"

    assert_text "Olympicperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Olympicperson" do
    visit olympicpeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Olympicperson was successfully destroyed"
  end
end
