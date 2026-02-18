require "application_system_test_case"

class ReactionsTextsTest < ApplicationSystemTestCase
  setup do
    @reactions_text = reactions_texts(:one)
  end

  test "visiting the index" do
    visit reactions_texts_url
    assert_selector "h1", text: "Reactions Texts"
  end

  test "creating a Reactions text" do
    visit reactions_texts_url
    click_on "New Reactions Text"

    fill_in "Name", with: @reactions_text.name
    click_on "Create Reactions text"

    assert_text "Reactions text was successfully created"
    click_on "Back"
  end

  test "updating a Reactions text" do
    visit reactions_texts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @reactions_text.name
    click_on "Update Reactions text"

    assert_text "Reactions text was successfully updated"
    click_on "Back"
  end

  test "destroying a Reactions text" do
    visit reactions_texts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reactions text was successfully destroyed"
  end
end
