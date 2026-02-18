require "application_system_test_case"

class TaskactionsTest < ApplicationSystemTestCase
  setup do
    @taskaction = taskactions(:one)
  end

  test "visiting the index" do
    visit taskactions_url
    assert_selector "h1", text: "Taskactions"
  end

  test "creating a Taskaction" do
    visit taskactions_url
    click_on "New Taskaction"

    fill_in "Name de", with: @taskaction.name_de
    fill_in "Name en", with: @taskaction.name_en
    fill_in "Name fr", with: @taskaction.name_fr
    click_on "Create Taskaction"

    assert_text "Taskaction was successfully created"
    click_on "Back"
  end

  test "updating a Taskaction" do
    visit taskactions_url
    click_on "Edit", match: :first

    fill_in "Name de", with: @taskaction.name_de
    fill_in "Name en", with: @taskaction.name_en
    fill_in "Name fr", with: @taskaction.name_fr
    click_on "Update Taskaction"

    assert_text "Taskaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Taskaction" do
    visit taskactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Taskaction was successfully destroyed"
  end
end
