require "application_system_test_case"

class MoviescenesTest < ApplicationSystemTestCase
  setup do
    @moviescene = moviescenes(:one)
  end

  test "visiting the index" do
    visit moviescenes_url
    assert_selector "h1", text: "Moviescenes"
  end

  test "creating a Moviescene" do
    visit moviescenes_url
    click_on "New Moviescene"

    fill_in "Description", with: @moviescene.description
    fill_in "Title", with: @moviescene.title
    click_on "Create Moviescene"

    assert_text "Moviescene was successfully created"
    click_on "Back"
  end

  test "updating a Moviescene" do
    visit moviescenes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @moviescene.description
    fill_in "Title", with: @moviescene.title
    click_on "Update Moviescene"

    assert_text "Moviescene was successfully updated"
    click_on "Back"
  end

  test "destroying a Moviescene" do
    visit moviescenes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Moviescene was successfully destroyed"
  end
end
