require "application_system_test_case"

class MusicalscoresTest < ApplicationSystemTestCase
  setup do
    @musicalscore = musicalscores(:one)
  end

  test "visiting the index" do
    visit musicalscores_url
    assert_selector "h1", text: "Musicalscores"
  end

  test "creating a Musicalscore" do
    visit musicalscores_url
    click_on "New Musicalscore"

    fill_in "Description", with: @musicalscore.description
    fill_in "Image", with: @musicalscore.image
    fill_in "Name", with: @musicalscore.name
    click_on "Create Musicalscore"

    assert_text "Musicalscore was successfully created"
    click_on "Back"
  end

  test "updating a Musicalscore" do
    visit musicalscores_url
    click_on "Edit", match: :first

    fill_in "Description", with: @musicalscore.description
    fill_in "Image", with: @musicalscore.image
    fill_in "Name", with: @musicalscore.name
    click_on "Update Musicalscore"

    assert_text "Musicalscore was successfully updated"
    click_on "Back"
  end

  test "destroying a Musicalscore" do
    visit musicalscores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Musicalscore was successfully destroyed"
  end
end
