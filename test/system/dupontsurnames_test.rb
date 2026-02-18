require "application_system_test_case"

class DupontsurnamesTest < ApplicationSystemTestCase
  setup do
    @dupontsurname = dupontsurnames(:one)
  end

  test "visiting the index" do
    visit dupontsurnames_url
    assert_selector "h1", text: "Dupontsurnames"
  end

  test "creating a Dupontsurname" do
    visit dupontsurnames_url
    click_on "New Dupontsurname"

    fill_in "Name", with: @dupontsurname.name
    click_on "Create Dupontsurname"

    assert_text "Dupontsurname was successfully created"
    click_on "Back"
  end

  test "updating a Dupontsurname" do
    visit dupontsurnames_url
    click_on "Edit", match: :first

    fill_in "Name", with: @dupontsurname.name
    click_on "Update Dupontsurname"

    assert_text "Dupontsurname was successfully updated"
    click_on "Back"
  end

  test "destroying a Dupontsurname" do
    visit dupontsurnames_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dupontsurname was successfully destroyed"
  end
end
