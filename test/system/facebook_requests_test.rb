require "application_system_test_case"

class FacebookRequestsTest < ApplicationSystemTestCase
  setup do
    @facebook_request = facebook_requests(:one)
  end

  test "visiting the index" do
    visit facebook_requests_url
    assert_selector "h1", text: "Facebook Requests"
  end

  test "creating a Facebook request" do
    visit facebook_requests_url
    click_on "New Facebook Request"

    fill_in "Name", with: @facebook_request.name
    click_on "Create Facebook request"

    assert_text "Facebook request was successfully created"
    click_on "Back"
  end

  test "updating a Facebook request" do
    visit facebook_requests_url
    click_on "Edit", match: :first

    fill_in "Name", with: @facebook_request.name
    click_on "Update Facebook request"

    assert_text "Facebook request was successfully updated"
    click_on "Back"
  end

  test "destroying a Facebook request" do
    visit facebook_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Facebook request was successfully destroyed"
  end
end
