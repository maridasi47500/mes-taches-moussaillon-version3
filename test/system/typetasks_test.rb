require "application_system_test_case"

class TypetasksTest < ApplicationSystemTestCase
  setup do
    @typetask = typetasks(:one)
  end

  test "visiting the index" do
    visit typetasks_url
    assert_selector "h1", text: "Typetasks"
  end

  test "creating a Typetask" do
    visit typetasks_url
    click_on "New Typetask"

    fill_in "Image", with: @typetask.image
    fill_in "Name", with: @typetask.name
    click_on "Create Typetask"

    assert_text "Typetask was successfully created"
    click_on "Back"
  end

  test "updating a Typetask" do
    visit typetasks_url
    click_on "Edit", match: :first

    fill_in "Image", with: @typetask.image
    fill_in "Name", with: @typetask.name
    click_on "Update Typetask"

    assert_text "Typetask was successfully updated"
    click_on "Back"
  end

  test "destroying a Typetask" do
    visit typetasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Typetask was successfully destroyed"
  end
end
