require "application_system_test_case"

class BasicGuyacadeauxTest < ApplicationSystemTestCase
  setup do
    @basic_guyacadeau = basic_guyacadeaux(:one)
  end

  test "visiting the index" do
    visit basic_guyacadeaux_url
    assert_selector "h1", text: "Basic Guyacadeaux"
  end

  test "creating a Basic guyacadeau" do
    visit basic_guyacadeaux_url
    click_on "New Basic Guyacadeau"

    fill_in "Address", with: @basic_guyacadeau.address_id
    fill_in "Person", with: @basic_guyacadeau.person_id
    fill_in "Price", with: @basic_guyacadeau.price
    click_on "Create Basic guyacadeau"

    assert_text "Basic guyacadeau was successfully created"
    click_on "Back"
  end

  test "updating a Basic guyacadeau" do
    visit basic_guyacadeaux_url
    click_on "Edit", match: :first

    fill_in "Address", with: @basic_guyacadeau.address_id
    fill_in "Person", with: @basic_guyacadeau.person_id
    fill_in "Price", with: @basic_guyacadeau.price
    click_on "Update Basic guyacadeau"

    assert_text "Basic guyacadeau was successfully updated"
    click_on "Back"
  end

  test "destroying a Basic guyacadeau" do
    visit basic_guyacadeaux_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Basic guyacadeau was successfully destroyed"
  end
end
