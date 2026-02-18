require "application_system_test_case"

class BarcriteriaTest < ApplicationSystemTestCase
  setup do
    @barcriterium = barcriteria(:one)
  end

  test "visiting the index" do
    visit barcriteria_url
    assert_selector "h1", text: "Barcriteria"
  end

  test "creating a Barcriterium" do
    visit barcriteria_url
    click_on "New Barcriterium"

    fill_in "Description", with: @barcriterium.description
    fill_in "Gooduser", with: @barcriterium.gooduser_id
    fill_in "Musicalscore", with: @barcriterium.musicalscore_id
    click_on "Create Barcriterium"

    assert_text "Barcriterium was successfully created"
    click_on "Back"
  end

  test "updating a Barcriterium" do
    visit barcriteria_url
    click_on "Edit", match: :first

    fill_in "Description", with: @barcriterium.description
    fill_in "Gooduser", with: @barcriterium.gooduser_id
    fill_in "Musicalscore", with: @barcriterium.musicalscore_id
    click_on "Update Barcriterium"

    assert_text "Barcriterium was successfully updated"
    click_on "Back"
  end

  test "destroying a Barcriterium" do
    visit barcriteria_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barcriterium was successfully destroyed"
  end
end
