require "application_system_test_case"

class SalutmilitairesTest < ApplicationSystemTestCase
  setup do
    @salutmilitaire = salutmilitaires(:one)
  end

  test "visiting the index" do
    visit salutmilitaires_url
    assert_selector "h1", text: "Salutmilitaires"
  end

  test "creating a Salutmilitaire" do
    visit salutmilitaires_url
    click_on "New Salutmilitaire"

    fill_in "Tickets attributes", with: @salutmilitaire.tickets_attributes
    click_on "Create Salutmilitaire"

    assert_text "Salutmilitaire was successfully created"
    click_on "Back"
  end

  test "updating a Salutmilitaire" do
    visit salutmilitaires_url
    click_on "Edit", match: :first

    fill_in "Tickets attributes", with: @salutmilitaire.tickets_attributes
    click_on "Update Salutmilitaire"

    assert_text "Salutmilitaire was successfully updated"
    click_on "Back"
  end

  test "destroying a Salutmilitaire" do
    visit salutmilitaires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salutmilitaire was successfully destroyed"
  end
end
