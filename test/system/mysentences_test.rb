require "application_system_test_case"

class MysentencesTest < ApplicationSystemTestCase
  setup do
    @mysentence = mysentences(:one)
  end

  test "visiting the index" do
    visit mysentences_url
    assert_selector "h1", text: "Mysentences"
  end

  test "creating a Mysentence" do
    visit mysentences_url
    click_on "New Mysentence"

    fill_in "Content de", with: @mysentence.content_de
    fill_in "Content en", with: @mysentence.content_en
    fill_in "Content fr", with: @mysentence.content_fr
    click_on "Create Mysentence"

    assert_text "Mysentence was successfully created"
    click_on "Back"
  end

  test "updating a Mysentence" do
    visit mysentences_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @mysentence.content_de
    fill_in "Content en", with: @mysentence.content_en
    fill_in "Content fr", with: @mysentence.content_fr
    click_on "Update Mysentence"

    assert_text "Mysentence was successfully updated"
    click_on "Back"
  end

  test "destroying a Mysentence" do
    visit mysentences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mysentence was successfully destroyed"
  end
end
