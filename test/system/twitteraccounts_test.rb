require "application_system_test_case"

class TwitteraccountsTest < ApplicationSystemTestCase
  setup do
    @twitteraccount = twitteraccounts(:one)
  end

  test "visiting the index" do
    visit twitteraccounts_url
    assert_selector "h1", text: "Twitteraccounts"
  end

  test "creating a Twitteraccount" do
    visit twitteraccounts_url
    click_on "New Twitteraccount"

    fill_in "Name", with: @twitteraccount.name
    fill_in "Username", with: @twitteraccount.username
    click_on "Create Twitteraccount"

    assert_text "Twitteraccount was successfully created"
    click_on "Back"
  end

  test "updating a Twitteraccount" do
    visit twitteraccounts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @twitteraccount.name
    fill_in "Username", with: @twitteraccount.username
    click_on "Update Twitteraccount"

    assert_text "Twitteraccount was successfully updated"
    click_on "Back"
  end

  test "destroying a Twitteraccount" do
    visit twitteraccounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Twitteraccount was successfully destroyed"
  end
end
