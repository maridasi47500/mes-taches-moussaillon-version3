require "application_system_test_case"

class SetoftasksTest < ApplicationSystemTestCase
  setup do
    @setoftask = setoftasks(:one)
  end

  test "visiting the index" do
    visit setoftasks_url
    assert_selector "h1", text: "Setoftasks"
  end

  test "creating a Setoftask" do
    visit setoftasks_url
    click_on "New Setoftask"

    fill_in "Title", with: @setoftask.title
    click_on "Create Setoftask"

    assert_text "Setoftask was successfully created"
    click_on "Back"
  end

  test "updating a Setoftask" do
    visit setoftasks_url
    click_on "Edit", match: :first

    fill_in "Title", with: @setoftask.title
    click_on "Update Setoftask"

    assert_text "Setoftask was successfully updated"
    click_on "Back"
  end

  test "destroying a Setoftask" do
    visit setoftasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Setoftask was successfully destroyed"
  end
end
