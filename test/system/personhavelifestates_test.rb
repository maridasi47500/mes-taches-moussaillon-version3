require "application_system_test_case"

class PersonhavelifestatesTest < ApplicationSystemTestCase
  setup do
    @personhavelifestate = personhavelifestates(:one)
  end

  test "visiting the index" do
    visit personhavelifestates_url
    assert_selector "h1", text: "Personhavelifestates"
  end

  test "creating a Personhavelifestate" do
    visit personhavelifestates_url
    click_on "New Personhavelifestate"

    click_on "Create Personhavelifestate"

    assert_text "Personhavelifestate was successfully created"
    click_on "Back"
  end

  test "updating a Personhavelifestate" do
    visit personhavelifestates_url
    click_on "Edit", match: :first

    click_on "Update Personhavelifestate"

    assert_text "Personhavelifestate was successfully updated"
    click_on "Back"
  end

  test "destroying a Personhavelifestate" do
    visit personhavelifestates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personhavelifestate was successfully destroyed"
  end
end
