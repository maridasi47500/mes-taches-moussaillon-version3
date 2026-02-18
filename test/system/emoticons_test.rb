require "application_system_test_case"

class EmoticonsTest < ApplicationSystemTestCase
  setup do
    @emoticon = emoticons(:one)
  end

  test "visiting the index" do
    visit emoticons_url
    assert_selector "h1", text: "Emoticons"
  end

  test "creating a Emoticon" do
    visit emoticons_url
    click_on "New Emoticon"

    fill_in "Image", with: @emoticon.image
    fill_in "Title", with: @emoticon.title
    click_on "Create Emoticon"

    assert_text "Emoticon was successfully created"
    click_on "Back"
  end

  test "updating a Emoticon" do
    visit emoticons_url
    click_on "Edit", match: :first

    fill_in "Image", with: @emoticon.image
    fill_in "Title", with: @emoticon.title
    click_on "Update Emoticon"

    assert_text "Emoticon was successfully updated"
    click_on "Back"
  end

  test "destroying a Emoticon" do
    visit emoticons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Emoticon was successfully destroyed"
  end
end
