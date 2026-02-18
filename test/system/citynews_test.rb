require "application_system_test_case"

class CitynewsTest < ApplicationSystemTestCase
  setup do
    @citynews = citynews(:one)
  end

  test "visiting the index" do
    visit citynews_url
    assert_selector "h1", text: "Citynews"
  end

  test "creating a Citynews" do
    visit citynews_url
    click_on "New Citynews"

    click_on "Create Citynews"

    assert_text "Citynews was successfully created"
    click_on "Back"
  end

  test "updating a Citynews" do
    visit citynews_url
    click_on "Edit", match: :first

    click_on "Update Citynews"

    assert_text "Citynews was successfully updated"
    click_on "Back"
  end

  test "destroying a Citynews" do
    visit citynews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Citynews was successfully destroyed"
  end
end
