require "application_system_test_case"

class ComicbooksTest < ApplicationSystemTestCase
  setup do
    @comicbook = comicbooks(:one)
  end

  test "visiting the index" do
    visit comicbooks_url
    assert_selector "h1", text: "Comicbooks"
  end

  test "creating a Comicbook" do
    visit comicbooks_url
    click_on "New Comicbook"

    fill_in "Description", with: @comicbook.description
    fill_in "Image", with: @comicbook.image
    fill_in "Title", with: @comicbook.title
    click_on "Create Comicbook"

    assert_text "Comicbook was successfully created"
    click_on "Back"
  end

  test "updating a Comicbook" do
    visit comicbooks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @comicbook.description
    fill_in "Image", with: @comicbook.image
    fill_in "Title", with: @comicbook.title
    click_on "Update Comicbook"

    assert_text "Comicbook was successfully updated"
    click_on "Back"
  end

  test "destroying a Comicbook" do
    visit comicbooks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comicbook was successfully destroyed"
  end
end
