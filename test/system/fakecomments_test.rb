require "application_system_test_case"

class FakecommentsTest < ApplicationSystemTestCase
  setup do
    @fakecomment = fakecomments(:one)
  end

  test "visiting the index" do
    visit fakecomments_url
    assert_selector "h1", text: "Fakecomments"
  end

  test "creating a Fakecomment" do
    visit fakecomments_url
    click_on "New Fakecomment"

    fill_in "Author", with: @fakecomment.author
    fill_in "Content", with: @fakecomment.content
    click_on "Create Fakecomment"

    assert_text "Fakecomment was successfully created"
    click_on "Back"
  end

  test "updating a Fakecomment" do
    visit fakecomments_url
    click_on "Edit", match: :first

    fill_in "Author", with: @fakecomment.author
    fill_in "Content", with: @fakecomment.content
    click_on "Update Fakecomment"

    assert_text "Fakecomment was successfully updated"
    click_on "Back"
  end

  test "destroying a Fakecomment" do
    visit fakecomments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fakecomment was successfully destroyed"
  end
end
