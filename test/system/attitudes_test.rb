require "application_system_test_case"

class AttitudesTest < ApplicationSystemTestCase
  setup do
    @attitude = attitudes(:one)
  end

  test "visiting the index" do
    visit attitudes_url
    assert_selector "h1", text: "Attitudes"
  end

  test "creating a Attitude" do
    visit attitudes_url
    click_on "New Attitude"

    click_on "Create Attitude"

    assert_text "Attitude was successfully created"
    click_on "Back"
  end

  test "updating a Attitude" do
    visit attitudes_url
    click_on "Edit", match: :first

    click_on "Update Attitude"

    assert_text "Attitude was successfully updated"
    click_on "Back"
  end

  test "destroying a Attitude" do
    visit attitudes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attitude was successfully destroyed"
  end
end
