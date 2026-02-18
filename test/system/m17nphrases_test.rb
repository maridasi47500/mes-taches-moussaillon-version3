require "application_system_test_case"

class M17nphrasesTest < ApplicationSystemTestCase
  setup do
    @m17nphrase = m17nphrases(:one)
  end

  test "visiting the index" do
    visit m17nphrases_url
    assert_selector "h1", text: "M17nphrases"
  end

  test "creating a M17nphrase" do
    visit m17nphrases_url
    click_on "New M17nphrase"

    fill_in "Content de", with: @m17nphrase.content_de
    fill_in "Content en", with: @m17nphrase.content_en
    fill_in "Content fr", with: @m17nphrase.content_fr
    click_on "Create M17nphrase"

    assert_text "M17nphrase was successfully created"
    click_on "Back"
  end

  test "updating a M17nphrase" do
    visit m17nphrases_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @m17nphrase.content_de
    fill_in "Content en", with: @m17nphrase.content_en
    fill_in "Content fr", with: @m17nphrase.content_fr
    click_on "Update M17nphrase"

    assert_text "M17nphrase was successfully updated"
    click_on "Back"
  end

  test "destroying a M17nphrase" do
    visit m17nphrases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "M17nphrase was successfully destroyed"
  end
end
