require "application_system_test_case"

class LinkfamilypeopleTest < ApplicationSystemTestCase
  setup do
    @linkfamilyperson = linkfamilypeople(:one)
  end

  test "visiting the index" do
    visit linkfamilypeople_url
    assert_selector "h1", text: "Linkfamilypeople"
  end

  test "creating a Linkfamilyperson" do
    visit linkfamilypeople_url
    click_on "New Linkfamilyperson"

    fill_in "Otherperson", with: @linkfamilyperson.otherperson_id
    fill_in "Person", with: @linkfamilyperson.person_id
    fill_in "Spouselink", with: @linkfamilyperson.spouselink_id
    click_on "Create Linkfamilyperson"

    assert_text "Linkfamilyperson was successfully created"
    click_on "Back"
  end

  test "updating a Linkfamilyperson" do
    visit linkfamilypeople_url
    click_on "Edit", match: :first

    fill_in "Otherperson", with: @linkfamilyperson.otherperson_id
    fill_in "Person", with: @linkfamilyperson.person_id
    fill_in "Spouselink", with: @linkfamilyperson.spouselink_id
    click_on "Update Linkfamilyperson"

    assert_text "Linkfamilyperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Linkfamilyperson" do
    visit linkfamilypeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Linkfamilyperson was successfully destroyed"
  end
end
