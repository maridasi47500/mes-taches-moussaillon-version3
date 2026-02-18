require "application_system_test_case"

class MydocsTest < ApplicationSystemTestCase
  setup do
    @mydoc = mydocs(:one)
  end

  test "visiting the index" do
    visit mydocs_url
    assert_selector "h1", text: "Mydocs"
  end

  test "creating a Mydoc" do
    visit mydocs_url
    click_on "New Mydoc"

    fill_in "Action", with: @mydoc.action
    fill_in "Content", with: @mydoc.content
    fill_in "Controller", with: @mydoc.controller
    fill_in "User", with: @mydoc.user_id
    click_on "Create Mydoc"

    assert_text "Mydoc was successfully created"
    click_on "Back"
  end

  test "updating a Mydoc" do
    visit mydocs_url
    click_on "Edit", match: :first

    fill_in "Action", with: @mydoc.action
    fill_in "Content", with: @mydoc.content
    fill_in "Controller", with: @mydoc.controller
    fill_in "User", with: @mydoc.user_id
    click_on "Update Mydoc"

    assert_text "Mydoc was successfully updated"
    click_on "Back"
  end

  test "destroying a Mydoc" do
    visit mydocs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mydoc was successfully destroyed"
  end
end
