require "application_system_test_case"

class RealfactsTest < ApplicationSystemTestCase
  setup do
    @realfact = realfacts(:one)
  end

  test "visiting the index" do
    visit realfacts_url
    assert_selector "h1", text: "Realfacts"
  end

  test "creating a Realfact" do
    visit realfacts_url
    click_on "New Realfact"

    fill_in "Content de", with: @realfact.content_de
    fill_in "Content en", with: @realfact.content_en
    fill_in "Content fr", with: @realfact.content_fr
    click_on "Create Realfact"

    assert_text "Realfact was successfully created"
    click_on "Back"
  end

  test "updating a Realfact" do
    visit realfacts_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @realfact.content_de
    fill_in "Content en", with: @realfact.content_en
    fill_in "Content fr", with: @realfact.content_fr
    click_on "Update Realfact"

    assert_text "Realfact was successfully updated"
    click_on "Back"
  end

  test "destroying a Realfact" do
    visit realfacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Realfact was successfully destroyed"
  end
end
