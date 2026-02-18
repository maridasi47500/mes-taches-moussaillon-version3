require "application_system_test_case"

class AnaphorsTest < ApplicationSystemTestCase
  setup do
    @anaphor = anaphors(:one)
  end

  test "visiting the index" do
    visit anaphors_url
    assert_selector "h1", text: "Anaphors"
  end

  test "creating a Anaphor" do
    visit anaphors_url
    click_on "New Anaphor"

    click_on "Create Anaphor"

    assert_text "Anaphor was successfully created"
    click_on "Back"
  end

  test "updating a Anaphor" do
    visit anaphors_url
    click_on "Edit", match: :first

    click_on "Update Anaphor"

    assert_text "Anaphor was successfully updated"
    click_on "Back"
  end

  test "destroying a Anaphor" do
    visit anaphors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Anaphor was successfully destroyed"
  end
end
