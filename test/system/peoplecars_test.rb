require "application_system_test_case"

class PeoplecarsTest < ApplicationSystemTestCase
  setup do
    @peoplecar = peoplecars(:one)
  end

  test "visiting the index" do
    visit peoplecars_url
    assert_selector "h1", text: "Peoplecars"
  end

  test "creating a Peoplecar" do
    visit peoplecars_url
    click_on "New Peoplecar"

    fill_in "Car", with: @peoplecar.car_id
    fill_in "Person", with: @peoplecar.person_id
    fill_in "User", with: @peoplecar.user_id
    click_on "Create Peoplecar"

    assert_text "Peoplecar was successfully created"
    click_on "Back"
  end

  test "updating a Peoplecar" do
    visit peoplecars_url
    click_on "Edit", match: :first

    fill_in "Car", with: @peoplecar.car_id
    fill_in "Person", with: @peoplecar.person_id
    fill_in "User", with: @peoplecar.user_id
    click_on "Update Peoplecar"

    assert_text "Peoplecar was successfully updated"
    click_on "Back"
  end

  test "destroying a Peoplecar" do
    visit peoplecars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Peoplecar was successfully destroyed"
  end
end
