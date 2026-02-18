require "application_system_test_case"

class FakelinksfamilypeopleTest < ApplicationSystemTestCase
  setup do
    @fakelinksfamilyperson = fakelinksfamilypeople(:one)
  end

  test "visiting the index" do
    visit fakelinksfamilypeople_url
    assert_selector "h1", text: "Fakelinksfamilypeople"
  end

  test "creating a Fakelinksfamilyperson" do
    visit fakelinksfamilypeople_url
    click_on "New Fakelinksfamilyperson"

    fill_in "Familylink", with: @fakelinksfamilyperson.familylink_id
    fill_in "Twoperson", with: @fakelinksfamilyperson.twoperson_id
    fill_in "User", with: @fakelinksfamilyperson.user_id
    click_on "Create Fakelinksfamilyperson"

    assert_text "Fakelinksfamilyperson was successfully created"
    click_on "Back"
  end

  test "updating a Fakelinksfamilyperson" do
    visit fakelinksfamilypeople_url
    click_on "Edit", match: :first

    fill_in "Familylink", with: @fakelinksfamilyperson.familylink_id
    fill_in "Twoperson", with: @fakelinksfamilyperson.twoperson_id
    fill_in "User", with: @fakelinksfamilyperson.user_id
    click_on "Update Fakelinksfamilyperson"

    assert_text "Fakelinksfamilyperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Fakelinksfamilyperson" do
    visit fakelinksfamilypeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fakelinksfamilyperson was successfully destroyed"
  end
end
