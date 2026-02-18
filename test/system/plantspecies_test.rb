require "application_system_test_case"

class PlantspeciesTest < ApplicationSystemTestCase
  setup do
    @plantspecy = plantspecies(:one)
  end

  test "visiting the index" do
    visit plantspecies_url
    assert_selector "h1", text: "Plantspecies"
  end

  test "creating a Plantspecie" do
    visit plantspecies_url
    click_on "New Plantspecie"

    fill_in "Image", with: @plantspecy.image
    fill_in "Name", with: @plantspecy.name
    click_on "Create Plantspecie"

    assert_text "Plantspecie was successfully created"
    click_on "Back"
  end

  test "updating a Plantspecie" do
    visit plantspecies_url
    click_on "Edit", match: :first

    fill_in "Image", with: @plantspecy.image
    fill_in "Name", with: @plantspecy.name
    click_on "Update Plantspecie"

    assert_text "Plantspecie was successfully updated"
    click_on "Back"
  end

  test "destroying a Plantspecie" do
    visit plantspecies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plantspecie was successfully destroyed"
  end
end
