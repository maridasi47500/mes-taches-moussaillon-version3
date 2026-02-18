require "application_system_test_case"

class FakecouplesTest < ApplicationSystemTestCase
  setup do
    @fakecouple = fakecouples(:one)
  end

  test "visiting the index" do
    visit fakecouples_url
    assert_selector "h1", text: "Fakecouples"
  end

  test "creating a Fakecouple" do
    visit fakecouples_url
    click_on "New Fakecouple"

    click_on "Create Fakecouple"

    assert_text "Fakecouple was successfully created"
    click_on "Back"
  end

  test "updating a Fakecouple" do
    visit fakecouples_url
    click_on "Edit", match: :first

    click_on "Update Fakecouple"

    assert_text "Fakecouple was successfully updated"
    click_on "Back"
  end

  test "destroying a Fakecouple" do
    visit fakecouples_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fakecouple was successfully destroyed"
  end
end
