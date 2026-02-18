require "application_system_test_case"

class PersonhavelifestateshavephotosTest < ApplicationSystemTestCase
  setup do
    @personhavelifestateshavephoto = personhavelifestateshavephotos(:one)
  end

  test "visiting the index" do
    visit personhavelifestateshavephotos_url
    assert_selector "h1", text: "Personhavelifestateshavephotos"
  end

  test "creating a Personhavelifestateshavephoto" do
    visit personhavelifestateshavephotos_url
    click_on "New Personhavelifestateshavephoto"

    fill_in "Personhavelifestate", with: @personhavelifestateshavephoto.personhavelifestate_id
    fill_in "Photo", with: @personhavelifestateshavephoto.photo_id
    click_on "Create Personhavelifestateshavephoto"

    assert_text "Personhavelifestateshavephoto was successfully created"
    click_on "Back"
  end

  test "updating a Personhavelifestateshavephoto" do
    visit personhavelifestateshavephotos_url
    click_on "Edit", match: :first

    fill_in "Personhavelifestate", with: @personhavelifestateshavephoto.personhavelifestate_id
    fill_in "Photo", with: @personhavelifestateshavephoto.photo_id
    click_on "Update Personhavelifestateshavephoto"

    assert_text "Personhavelifestateshavephoto was successfully updated"
    click_on "Back"
  end

  test "destroying a Personhavelifestateshavephoto" do
    visit personhavelifestateshavephotos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personhavelifestateshavephoto was successfully destroyed"
  end
end
