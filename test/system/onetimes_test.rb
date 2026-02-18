require "application_system_test_case"

class OnetimesTest < ApplicationSystemTestCase
  setup do
    @onetime = onetimes(:one)
  end

  test "visiting the index" do
    visit onetimes_url
    assert_selector "h1", text: "Onetimes"
  end

  test "creating a Onetime" do
    visit onetimes_url
    click_on "New Onetime"

    fill_in "Content", with: @onetime.content
    fill_in "Pronoun", with: @onetime.pronoun_id
    click_on "Create Onetime"

    assert_text "Onetime was successfully created"
    click_on "Back"
  end

  test "updating a Onetime" do
    visit onetimes_url
    click_on "Edit", match: :first

    fill_in "Content", with: @onetime.content
    fill_in "Pronoun", with: @onetime.pronoun_id
    click_on "Update Onetime"

    assert_text "Onetime was successfully updated"
    click_on "Back"
  end

  test "destroying a Onetime" do
    visit onetimes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Onetime was successfully destroyed"
  end
end
