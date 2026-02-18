require "application_system_test_case"

class PostsSurnamesTest < ApplicationSystemTestCase
  setup do
    @posts_surname = posts_surnames(:one)
  end

  test "visiting the index" do
    visit posts_surnames_url
    assert_selector "h1", text: "Posts Surnames"
  end

  test "creating a Posts surname" do
    visit posts_surnames_url
    click_on "New Posts Surname"

    click_on "Create Posts surname"

    assert_text "Posts surname was successfully created"
    click_on "Back"
  end

  test "updating a Posts surname" do
    visit posts_surnames_url
    click_on "Edit", match: :first

    click_on "Update Posts surname"

    assert_text "Posts surname was successfully updated"
    click_on "Back"
  end

  test "destroying a Posts surname" do
    visit posts_surnames_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Posts surname was successfully destroyed"
  end
end
