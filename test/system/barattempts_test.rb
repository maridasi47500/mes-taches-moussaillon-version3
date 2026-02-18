require "application_system_test_case"

class BarattemptsTest < ApplicationSystemTestCase
  setup do
    @barattempt = barattempts(:one)
  end

  test "visiting the index" do
    visit barattempts_url
    assert_selector "h1", text: "Barattempts"
  end

  test "creating a Barattempt" do
    visit barattempts_url
    click_on "New Barattempt"

    fill_in "Bar", with: @barattempt.bar_id
    fill_in "Person", with: @barattempt.person_id
    fill_in "Score", with: @barattempt.score_id
    fill_in "User", with: @barattempt.user_id
    click_on "Create Barattempt"

    assert_text "Barattempt was successfully created"
    click_on "Back"
  end

  test "updating a Barattempt" do
    visit barattempts_url
    click_on "Edit", match: :first

    fill_in "Bar", with: @barattempt.bar_id
    fill_in "Person", with: @barattempt.person_id
    fill_in "Score", with: @barattempt.score_id
    fill_in "User", with: @barattempt.user_id
    click_on "Update Barattempt"

    assert_text "Barattempt was successfully updated"
    click_on "Back"
  end

  test "destroying a Barattempt" do
    visit barattempts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barattempt was successfully destroyed"
  end
end
