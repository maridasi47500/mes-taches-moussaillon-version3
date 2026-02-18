require "application_system_test_case"

class AregoodrequestsTest < ApplicationSystemTestCase
  setup do
    @aregoodrequest = aregoodrequests(:one)
  end

  test "visiting the index" do
    visit aregoodrequests_url
    assert_selector "h1", text: "Aregoodrequests"
  end

  test "creating a Aregoodrequest" do
    visit aregoodrequests_url
    click_on "New Aregoodrequest"

    click_on "Create Aregoodrequest"

    assert_text "Aregoodrequest was successfully created"
    click_on "Back"
  end

  test "updating a Aregoodrequest" do
    visit aregoodrequests_url
    click_on "Edit", match: :first

    click_on "Update Aregoodrequest"

    assert_text "Aregoodrequest was successfully updated"
    click_on "Back"
  end

  test "destroying a Aregoodrequest" do
    visit aregoodrequests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aregoodrequest was successfully destroyed"
  end
end
