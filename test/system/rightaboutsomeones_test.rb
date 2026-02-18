require "application_system_test_case"

class RightaboutsomeonesTest < ApplicationSystemTestCase
  setup do
    @rightaboutsomeone = rightaboutsomeones(:one)
  end

  test "visiting the index" do
    visit rightaboutsomeones_url
    assert_selector "h1", text: "Rightaboutsomeones"
  end

  test "creating a Rightaboutsomeone" do
    visit rightaboutsomeones_url
    click_on "New Rightaboutsomeone"

    fill_in "Description de", with: @rightaboutsomeone.description_de
    fill_in "Description en", with: @rightaboutsomeone.description_en
    fill_in "Description fr", with: @rightaboutsomeone.description_fr
    fill_in "Question de", with: @rightaboutsomeone.question_de
    fill_in "Question en", with: @rightaboutsomeone.question_en
    fill_in "Question fr", with: @rightaboutsomeone.question_fr
    click_on "Create Rightaboutsomeone"

    assert_text "Rightaboutsomeone was successfully created"
    click_on "Back"
  end

  test "updating a Rightaboutsomeone" do
    visit rightaboutsomeones_url
    click_on "Edit", match: :first

    fill_in "Description de", with: @rightaboutsomeone.description_de
    fill_in "Description en", with: @rightaboutsomeone.description_en
    fill_in "Description fr", with: @rightaboutsomeone.description_fr
    fill_in "Question de", with: @rightaboutsomeone.question_de
    fill_in "Question en", with: @rightaboutsomeone.question_en
    fill_in "Question fr", with: @rightaboutsomeone.question_fr
    click_on "Update Rightaboutsomeone"

    assert_text "Rightaboutsomeone was successfully updated"
    click_on "Back"
  end

  test "destroying a Rightaboutsomeone" do
    visit rightaboutsomeones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rightaboutsomeone was successfully destroyed"
  end
end
