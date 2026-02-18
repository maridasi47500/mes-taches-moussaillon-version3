require "application_system_test_case"

class PersonhavelifestateshaverequeststopeopleTest < ApplicationSystemTestCase
  setup do
    @personhavelifestateshaverequeststoperson = personhavelifestateshaverequeststopeople(:one)
  end

  test "visiting the index" do
    visit personhavelifestateshaverequeststopeople_url
    assert_selector "h1", text: "Personhavelifestateshaverequeststopeople"
  end

  test "creating a Personhavelifestateshaverequeststoperson" do
    visit personhavelifestateshaverequeststopeople_url
    click_on "New Personhavelifestateshaverequeststoperson"

    fill_in "Personhavelifestate", with: @personhavelifestateshaverequeststoperson.personhavelifestate_id
    fill_in "Requeststoperson", with: @personhavelifestateshaverequeststoperson.requeststoperson_id
    click_on "Create Personhavelifestateshaverequeststoperson"

    assert_text "Personhavelifestateshaverequeststoperson was successfully created"
    click_on "Back"
  end

  test "updating a Personhavelifestateshaverequeststoperson" do
    visit personhavelifestateshaverequeststopeople_url
    click_on "Edit", match: :first

    fill_in "Personhavelifestate", with: @personhavelifestateshaverequeststoperson.personhavelifestate_id
    fill_in "Requeststoperson", with: @personhavelifestateshaverequeststoperson.requeststoperson_id
    click_on "Update Personhavelifestateshaverequeststoperson"

    assert_text "Personhavelifestateshaverequeststoperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Personhavelifestateshaverequeststoperson" do
    visit personhavelifestateshaverequeststopeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personhavelifestateshaverequeststoperson was successfully destroyed"
  end
end
