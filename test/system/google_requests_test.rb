require "application_system_test_case"

class GoogleRequestsTest < ApplicationSystemTestCase
  setup do
    @google_request = google_requests(:one)
  end

  test "visiting the index" do
    visit google_requests_url
    assert_selector "h1", text: "Google Requests"
  end

  test "creating a Google request" do
    visit google_requests_url
    click_on "New Google Request"

    fill_in "Name", with: @google_request.name
    click_on "Create Google request"

    assert_text "Google request was successfully created"
    click_on "Back"
  end

  test "updating a Google request" do
    visit google_requests_url
    click_on "Edit", match: :first

    fill_in "Name", with: @google_request.name
    click_on "Update Google request"

    assert_text "Google request was successfully updated"
    click_on "Back"
  end

  test "destroying a Google request" do
    visit google_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Google request was successfully destroyed"
  end
end
