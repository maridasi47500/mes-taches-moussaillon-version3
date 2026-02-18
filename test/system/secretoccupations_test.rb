require "application_system_test_case"

class SecretoccupationsTest < ApplicationSystemTestCase
  setup do
    @secretoccupation = secretoccupations(:one)
  end

  test "visiting the index" do
    visit secretoccupations_url
    assert_selector "h1", text: "Secretoccupations"
  end

  test "creating a Secretoccupation" do
    visit secretoccupations_url
    click_on "New Secretoccupation"

    fill_in "Content de", with: @secretoccupation.content_de
    fill_in "Content en", with: @secretoccupation.content_en
    fill_in "Content fr", with: @secretoccupation.content_fr
    click_on "Create Secretoccupation"

    assert_text "Secretoccupation was successfully created"
    click_on "Back"
  end

  test "updating a Secretoccupation" do
    visit secretoccupations_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @secretoccupation.content_de
    fill_in "Content en", with: @secretoccupation.content_en
    fill_in "Content fr", with: @secretoccupation.content_fr
    click_on "Update Secretoccupation"

    assert_text "Secretoccupation was successfully updated"
    click_on "Back"
  end

  test "destroying a Secretoccupation" do
    visit secretoccupations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Secretoccupation was successfully destroyed"
  end
end
