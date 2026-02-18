require "application_system_test_case"

class LifestateshaverequestsTest < ApplicationSystemTestCase
  setup do
    @lifestateshaverequest = lifestateshaverequests(:one)
  end

  test "visiting the index" do
    visit lifestateshaverequests_url
    assert_selector "h1", text: "Lifestateshaverequests"
  end

  test "creating a Lifestateshaverequest" do
    visit lifestateshaverequests_url
    click_on "New Lifestateshaverequest"

    fill_in "Personhavelifestate", with: @lifestateshaverequest.personhavelifestate_id
    fill_in "Requeststoperson", with: @lifestateshaverequest.requeststoperson_id
    click_on "Create Lifestateshaverequest"

    assert_text "Lifestateshaverequest was successfully created"
    click_on "Back"
  end

  test "updating a Lifestateshaverequest" do
    visit lifestateshaverequests_url
    click_on "Edit", match: :first

    fill_in "Personhavelifestate", with: @lifestateshaverequest.personhavelifestate_id
    fill_in "Requeststoperson", with: @lifestateshaverequest.requeststoperson_id
    click_on "Update Lifestateshaverequest"

    assert_text "Lifestateshaverequest was successfully updated"
    click_on "Back"
  end

  test "destroying a Lifestateshaverequest" do
    visit lifestateshaverequests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lifestateshaverequest was successfully destroyed"
  end
end
