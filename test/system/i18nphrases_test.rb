require "application_system_test_case"

class I18nphrasesTest < ApplicationSystemTestCase
  setup do
    @i18nphrase = i18nphrases(:one)
  end

  test "visiting the index" do
    visit i18nphrases_url
    assert_selector "h1", text: "I18nphrases"
  end

  test "creating a I18nphrase" do
    visit i18nphrases_url
    click_on "New I18nphrase"

    fill_in "Content de", with: @i18nphrase.content_de
    fill_in "Content en", with: @i18nphrase.content_en
    fill_in "Content fr", with: @i18nphrase.content_fr
    click_on "Create I18nphrase"

    assert_text "I18nphrase was successfully created"
    click_on "Back"
  end

  test "updating a I18nphrase" do
    visit i18nphrases_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @i18nphrase.content_de
    fill_in "Content en", with: @i18nphrase.content_en
    fill_in "Content fr", with: @i18nphrase.content_fr
    click_on "Update I18nphrase"

    assert_text "I18nphrase was successfully updated"
    click_on "Back"
  end

  test "destroying a I18nphrase" do
    visit i18nphrases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "I18nphrase was successfully destroyed"
  end
end
