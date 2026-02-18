require "application_system_test_case"

class ArgentTest < ApplicationSystemTestCase
  setup do
    @argent = argent(:one)
  end

  test "visiting the index" do
    visit argent_url
    assert_selector "h1", text: "Argent"
  end

  test "creating a Argent" do
    visit argent_url
    click_on "New Argent"

    fill_in "Annee", with: @argent.annee
    fill_in "Apayer", with: @argent.apayer
    fill_in "Mois", with: @argent.mois
    fill_in "Paye", with: @argent.paye
    fill_in "Username", with: @argent.username
    click_on "Create Argent"

    assert_text "Argent was successfully created"
    click_on "Back"
  end

  test "updating a Argent" do
    visit argent_url
    click_on "Edit", match: :first

    fill_in "Annee", with: @argent.annee
    fill_in "Apayer", with: @argent.apayer
    fill_in "Mois", with: @argent.mois
    fill_in "Paye", with: @argent.paye
    fill_in "Username", with: @argent.username
    click_on "Update Argent"

    assert_text "Argent was successfully updated"
    click_on "Back"
  end

  test "destroying a Argent" do
    visit argent_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Argent was successfully destroyed"
  end
end
