require "application_system_test_case"

class LinkspousepeopleTest < ApplicationSystemTestCase
  setup do
    @linkspouseperson = linkspousepeople(:one)
  end

  test "visiting the index" do
    visit linkspousepeople_url
    assert_selector "h1", text: "Linkspousepeople"
  end

  test "creating a Linkspouseperson" do
    visit linkspousepeople_url
    click_on "New Linkspouseperson"

    fill_in "Otherperson", with: @linkspouseperson.otherperson_id
    fill_in "Person", with: @linkspouseperson.person_id
    fill_in "Spouselink", with: @linkspouseperson.spouselink_id
    click_on "Create Linkspouseperson"

    assert_text "Linkspouseperson was successfully created"
    click_on "Back"
  end

  test "updating a Linkspouseperson" do
    visit linkspousepeople_url
    click_on "Edit", match: :first

    fill_in "Otherperson", with: @linkspouseperson.otherperson_id
    fill_in "Person", with: @linkspouseperson.person_id
    fill_in "Spouselink", with: @linkspouseperson.spouselink_id
    click_on "Update Linkspouseperson"

    assert_text "Linkspouseperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Linkspouseperson" do
    visit linkspousepeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Linkspouseperson was successfully destroyed"
  end
end
