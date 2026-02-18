require "application_system_test_case"

class MusicalcompositionsTest < ApplicationSystemTestCase
  setup do
    @musicalcomposition = musicalcompositions(:one)
  end

  test "visiting the index" do
    visit musicalcompositions_url
    assert_selector "h1", text: "Musicalcompositions"
  end

  test "creating a Musicalcomposition" do
    visit musicalcompositions_url
    click_on "New Musicalcomposition"

    fill_in "Title", with: @musicalcomposition.title
    click_on "Create Musicalcomposition"

    assert_text "Musicalcomposition was successfully created"
    click_on "Back"
  end

  test "updating a Musicalcomposition" do
    visit musicalcompositions_url
    click_on "Edit", match: :first

    fill_in "Title", with: @musicalcomposition.title
    click_on "Update Musicalcomposition"

    assert_text "Musicalcomposition was successfully updated"
    click_on "Back"
  end

  test "destroying a Musicalcomposition" do
    visit musicalcompositions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Musicalcomposition was successfully destroyed"
  end
end
