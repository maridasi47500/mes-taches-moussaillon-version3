require "application_system_test_case"

class JinglesTest < ApplicationSystemTestCase
  setup do
    @jingle = jingles(:one)
  end

  test "visiting the index" do
    visit jingles_url
    assert_selector "h1", text: "Jingles"
  end

  test "creating a Jingle" do
    visit jingles_url
    click_on "New Jingle"

    fill_in "Content", with: @jingle.content
    fill_in "Name", with: @jingle.name
    fill_in "Posts surname", with: @jingle.posts_surname_id
    click_on "Create Jingle"

    assert_text "Jingle was successfully created"
    click_on "Back"
  end

  test "updating a Jingle" do
    visit jingles_url
    click_on "Edit", match: :first

    fill_in "Content", with: @jingle.content
    fill_in "Name", with: @jingle.name
    fill_in "Posts surname", with: @jingle.posts_surname_id
    click_on "Update Jingle"

    assert_text "Jingle was successfully updated"
    click_on "Back"
  end

  test "destroying a Jingle" do
    visit jingles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jingle was successfully destroyed"
  end
end
