require "application_system_test_case"

class WinningattitudesTest < ApplicationSystemTestCase
  setup do
    @winningattitude = winningattitudes(:one)
  end

  test "visiting the index" do
    visit winningattitudes_url
    assert_selector "h1", text: "Winningattitudes"
  end

  test "creating a Winningattitude" do
    visit winningattitudes_url
    click_on "New Winningattitude"

    fill_in "Content de", with: @winningattitude.content_de
    fill_in "Content en", with: @winningattitude.content_en
    fill_in "Content fr", with: @winningattitude.content_fr
    click_on "Create Winningattitude"

    assert_text "Winningattitude was successfully created"
    click_on "Back"
  end

  test "updating a Winningattitude" do
    visit winningattitudes_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @winningattitude.content_de
    fill_in "Content en", with: @winningattitude.content_en
    fill_in "Content fr", with: @winningattitude.content_fr
    click_on "Update Winningattitude"

    assert_text "Winningattitude was successfully updated"
    click_on "Back"
  end

  test "destroying a Winningattitude" do
    visit winningattitudes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Winningattitude was successfully destroyed"
  end
end
