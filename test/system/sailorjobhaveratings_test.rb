require "application_system_test_case"

class SailorjobhaveratingsTest < ApplicationSystemTestCase
  setup do
    @sailorjobhaverating = sailorjobhaveratings(:one)
  end

  test "visiting the index" do
    visit sailorjobhaveratings_url
    assert_selector "h1", text: "Sailorjobhaveratings"
  end

  test "creating a Sailorjobhaverating" do
    visit sailorjobhaveratings_url
    click_on "New Sailorjobhaverating"

    fill_in "Datetime", with: @sailorjobhaverating.datetime
    fill_in "Rating", with: @sailorjobhaverating.rating
    fill_in "Sailorjob", with: @sailorjobhaverating.sailorjob_id
    fill_in "User", with: @sailorjobhaverating.user_id
    click_on "Create Sailorjobhaverating"

    assert_text "Sailorjobhaverating was successfully created"
    click_on "Back"
  end

  test "updating a Sailorjobhaverating" do
    visit sailorjobhaveratings_url
    click_on "Edit", match: :first

    fill_in "Datetime", with: @sailorjobhaverating.datetime
    fill_in "Rating", with: @sailorjobhaverating.rating
    fill_in "Sailorjob", with: @sailorjobhaverating.sailorjob_id
    fill_in "User", with: @sailorjobhaverating.user_id
    click_on "Update Sailorjobhaverating"

    assert_text "Sailorjobhaverating was successfully updated"
    click_on "Back"
  end

  test "destroying a Sailorjobhaverating" do
    visit sailorjobhaveratings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sailorjobhaverating was successfully destroyed"
  end
end
