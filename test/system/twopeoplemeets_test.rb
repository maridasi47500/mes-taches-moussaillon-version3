require "application_system_test_case"

class TwopeoplemeetsTest < ApplicationSystemTestCase
  setup do
    @twopeoplemeet = twopeoplemeets(:one)
  end

  test "visiting the index" do
    visit twopeoplemeets_url
    assert_selector "h1", text: "Twopeoplemeets"
  end

  test "creating a Twopeoplemeet" do
    visit twopeoplemeets_url
    click_on "New Twopeoplemeet"

    fill_in "Otherperson", with: @twopeoplemeet.otherperson_id
    fill_in "Person", with: @twopeoplemeet.person_id
    click_on "Create Twopeoplemeet"

    assert_text "Twopeoplemeet was successfully created"
    click_on "Back"
  end

  test "updating a Twopeoplemeet" do
    visit twopeoplemeets_url
    click_on "Edit", match: :first

    fill_in "Otherperson", with: @twopeoplemeet.otherperson_id
    fill_in "Person", with: @twopeoplemeet.person_id
    click_on "Update Twopeoplemeet"

    assert_text "Twopeoplemeet was successfully updated"
    click_on "Back"
  end

  test "destroying a Twopeoplemeet" do
    visit twopeoplemeets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Twopeoplemeet was successfully destroyed"
  end
end
