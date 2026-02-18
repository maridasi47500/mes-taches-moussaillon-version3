require "application_system_test_case"

class MusicalkeysTest < ApplicationSystemTestCase
  setup do
    @musicalkey = musicalkeys(:one)
  end

  test "visiting the index" do
    visit musicalkeys_url
    assert_selector "h1", text: "Musicalkeys"
  end

  test "creating a Musicalkey" do
    visit musicalkeys_url
    click_on "New Musicalkey"

    fill_in "Name de", with: @musicalkey.name_de
    fill_in "Name en", with: @musicalkey.name_en
    fill_in "Name fr", with: @musicalkey.name_fr
    click_on "Create Musicalkey"

    assert_text "Musicalkey was successfully created"
    click_on "Back"
  end

  test "updating a Musicalkey" do
    visit musicalkeys_url
    click_on "Edit", match: :first

    fill_in "Name de", with: @musicalkey.name_de
    fill_in "Name en", with: @musicalkey.name_en
    fill_in "Name fr", with: @musicalkey.name_fr
    click_on "Update Musicalkey"

    assert_text "Musicalkey was successfully updated"
    click_on "Back"
  end

  test "destroying a Musicalkey" do
    visit musicalkeys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Musicalkey was successfully destroyed"
  end
end
