require "application_system_test_case"

class PetshaveownersTest < ApplicationSystemTestCase
  setup do
    @petshaveowner = petshaveowners(:one)
  end

  test "visiting the index" do
    visit petshaveowners_url
    assert_selector "h1", text: "Petshaveowners"
  end

  test "creating a Petshaveowner" do
    visit petshaveowners_url
    click_on "New Petshaveowner"

    click_on "Create Petshaveowner"

    assert_text "Petshaveowner was successfully created"
    click_on "Back"
  end

  test "updating a Petshaveowner" do
    visit petshaveowners_url
    click_on "Edit", match: :first

    click_on "Update Petshaveowner"

    assert_text "Petshaveowner was successfully updated"
    click_on "Back"
  end

  test "destroying a Petshaveowner" do
    visit petshaveowners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Petshaveowner was successfully destroyed"
  end
end
