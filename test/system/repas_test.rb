require "application_system_test_case"

class RepasTest < ApplicationSystemTestCase
  setup do
    @repas = repas(:one)
  end

  test "visiting the index" do
    visit repas_url
    assert_selector "h1", text: "Repas"
  end

  test "creating a Repas" do
    visit repas_url
    click_on "New Repas"

    fill_in "Date", with: @repas.date
    fill_in "Somme", with: @repas.somme
    fill_in "Username", with: @repas.username
    click_on "Create Repas"

    assert_text "Repas was successfully created"
    click_on "Back"
  end

  test "updating a Repas" do
    visit repas_url
    click_on "Edit", match: :first

    fill_in "Date", with: @repas.date
    fill_in "Somme", with: @repas.somme
    fill_in "Username", with: @repas.username
    click_on "Update Repas"

    assert_text "Repas was successfully updated"
    click_on "Back"
  end

  test "destroying a Repas" do
    visit repas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repas was successfully destroyed"
  end
end
