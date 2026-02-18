require "application_system_test_case"

class MylayoutsTest < ApplicationSystemTestCase
  setup do
    @mylayout = mylayouts(:one)
  end

  test "visiting the index" do
    visit mylayouts_url
    assert_selector "h1", text: "Mylayouts"
  end

  test "creating a Mylayout" do
    visit mylayouts_url
    click_on "New Mylayout"

    fill_in "Name", with: @mylayout.name
    fill_in "Title", with: @mylayout.title
    fill_in "Typelayout", with: @mylayout.typelayout
    click_on "Create Mylayout"

    assert_text "Mylayout was successfully created"
    click_on "Back"
  end

  test "updating a Mylayout" do
    visit mylayouts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @mylayout.name
    fill_in "Title", with: @mylayout.title
    fill_in "Typelayout", with: @mylayout.typelayout
    click_on "Update Mylayout"

    assert_text "Mylayout was successfully updated"
    click_on "Back"
  end

  test "destroying a Mylayout" do
    visit mylayouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mylayout was successfully destroyed"
  end
end
