require "application_system_test_case"

class TasktypesTest < ApplicationSystemTestCase
  setup do
    @tasktype = tasktypes(:one)
  end

  test "visiting the index" do
    visit tasktypes_url
    assert_selector "h1", text: "Tasktypes"
  end

  test "creating a Tasktype" do
    visit tasktypes_url
    click_on "New Tasktype"

    fill_in "Image", with: @tasktype.image
    fill_in "Name", with: @tasktype.name
    click_on "Create Tasktype"

    assert_text "Tasktype was successfully created"
    click_on "Back"
  end

  test "updating a Tasktype" do
    visit tasktypes_url
    click_on "Edit", match: :first

    fill_in "Image", with: @tasktype.image
    fill_in "Name", with: @tasktype.name
    click_on "Update Tasktype"

    assert_text "Tasktype was successfully updated"
    click_on "Back"
  end

  test "destroying a Tasktype" do
    visit tasktypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tasktype was successfully destroyed"
  end
end
