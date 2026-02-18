require "application_system_test_case"

class PrejudicesTest < ApplicationSystemTestCase
  setup do
    @prejudice = prejudices(:one)
  end

  test "visiting the index" do
    visit prejudices_url
    assert_selector "h1", text: "Prejudices"
  end

  test "creating a Prejudice" do
    visit prejudices_url
    click_on "New Prejudice"

    fill_in "Content de", with: @prejudice.content_de
    fill_in "Content en", with: @prejudice.content_en
    fill_in "Content fr", with: @prejudice.content_fr
    click_on "Create Prejudice"

    assert_text "Prejudice was successfully created"
    click_on "Back"
  end

  test "updating a Prejudice" do
    visit prejudices_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @prejudice.content_de
    fill_in "Content en", with: @prejudice.content_en
    fill_in "Content fr", with: @prejudice.content_fr
    click_on "Update Prejudice"

    assert_text "Prejudice was successfully updated"
    click_on "Back"
  end

  test "destroying a Prejudice" do
    visit prejudices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prejudice was successfully destroyed"
  end
end
