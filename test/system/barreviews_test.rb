require "application_system_test_case"

class BarreviewsTest < ApplicationSystemTestCase
  setup do
    @barreview = barreviews(:one)
  end

  test "visiting the index" do
    visit barreviews_url
    assert_selector "h1", text: "Barreviews"
  end

  test "creating a Barreview" do
    visit barreviews_url
    click_on "New Barreview"

    fill_in "Barattempt", with: @barreview.barattempt_id
    fill_in "Description", with: @barreview.description
    fill_in "User", with: @barreview.user_id
    click_on "Create Barreview"

    assert_text "Barreview was successfully created"
    click_on "Back"
  end

  test "updating a Barreview" do
    visit barreviews_url
    click_on "Edit", match: :first

    fill_in "Barattempt", with: @barreview.barattempt_id
    fill_in "Description", with: @barreview.description
    fill_in "User", with: @barreview.user_id
    click_on "Update Barreview"

    assert_text "Barreview was successfully updated"
    click_on "Back"
  end

  test "destroying a Barreview" do
    visit barreviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barreview was successfully destroyed"
  end
end
