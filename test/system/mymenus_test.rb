require "application_system_test_case"

class MymenusTest < ApplicationSystemTestCase
  setup do
    @mymenu = mymenus(:one)
  end

  test "visiting the index" do
    visit mymenus_url
    assert_selector "h1", text: "Mymenus"
  end

  test "creating a Mymenu" do
    visit mymenus_url
    click_on "New Mymenu"

    click_on "Create Mymenu"

    assert_text "Mymenu was successfully created"
    click_on "Back"
  end

  test "updating a Mymenu" do
    visit mymenus_url
    click_on "Edit", match: :first

    click_on "Update Mymenu"

    assert_text "Mymenu was successfully updated"
    click_on "Back"
  end

  test "destroying a Mymenu" do
    visit mymenus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mymenu was successfully destroyed"
  end
end
