require "application_system_test_case"

class GoogleresultsTest < ApplicationSystemTestCase
  setup do
    @googleresult = googleresults(:one)
  end

  test "visiting the index" do
    visit googleresults_url
    assert_selector "h1", text: "Googleresults"
  end

  test "creating a Googleresult" do
    visit googleresults_url
    click_on "New Googleresult"

    fill_in "Content", with: @googleresult.content
    click_on "Create Googleresult"

    assert_text "Googleresult was successfully created"
    click_on "Back"
  end

  test "updating a Googleresult" do
    visit googleresults_url
    click_on "Edit", match: :first

    fill_in "Content", with: @googleresult.content
    click_on "Update Googleresult"

    assert_text "Googleresult was successfully updated"
    click_on "Back"
  end

  test "destroying a Googleresult" do
    visit googleresults_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Googleresult was successfully destroyed"
  end
end
