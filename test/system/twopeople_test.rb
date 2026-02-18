require "application_system_test_case"

class TwopeopleTest < ApplicationSystemTestCase
  setup do
    @twoperson = twopeople(:one)
  end

  test "visiting the index" do
    visit twopeople_url
    assert_selector "h1", text: "Twopeople"
  end

  test "creating a Twoperson" do
    visit twopeople_url
    click_on "New Twoperson"

    fill_in "Otherperson", with: @twoperson.otherperson_id
    fill_in "Person", with: @twoperson.person_id
    click_on "Create Twoperson"

    assert_text "Twoperson was successfully created"
    click_on "Back"
  end

  test "updating a Twoperson" do
    visit twopeople_url
    click_on "Edit", match: :first

    fill_in "Otherperson", with: @twoperson.otherperson_id
    fill_in "Person", with: @twoperson.person_id
    click_on "Update Twoperson"

    assert_text "Twoperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Twoperson" do
    visit twopeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Twoperson was successfully destroyed"
  end
end
