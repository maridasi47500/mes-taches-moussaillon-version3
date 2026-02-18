require "application_system_test_case"

class WithorwithoutyousTest < ApplicationSystemTestCase
  setup do
    @withorwithoutyou = withorwithoutyous(:one)
  end

  test "visiting the index" do
    visit withorwithoutyous_url
    assert_selector "h1", text: "Withorwithoutyous"
  end

  test "creating a Withorwithoutyou" do
    visit withorwithoutyous_url
    click_on "New Withorwithoutyou"

    click_on "Create Withorwithoutyou"

    assert_text "Withorwithoutyou was successfully created"
    click_on "Back"
  end

  test "updating a Withorwithoutyou" do
    visit withorwithoutyous_url
    click_on "Edit", match: :first

    click_on "Update Withorwithoutyou"

    assert_text "Withorwithoutyou was successfully updated"
    click_on "Back"
  end

  test "destroying a Withorwithoutyou" do
    visit withorwithoutyous_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Withorwithoutyou was successfully destroyed"
  end
end
