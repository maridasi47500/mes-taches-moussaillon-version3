require "application_system_test_case"

class GithubaccountsTest < ApplicationSystemTestCase
  setup do
    @githubaccount = githubaccounts(:one)
  end

  test "visiting the index" do
    visit githubaccounts_url
    assert_selector "h1", text: "Githubaccounts"
  end

  test "creating a Githubaccount" do
    visit githubaccounts_url
    click_on "New Githubaccount"

    fill_in "Nameowner", with: @githubaccount.nameowner
    fill_in "Person", with: @githubaccount.person_id
    fill_in "Username", with: @githubaccount.username
    click_on "Create Githubaccount"

    assert_text "Githubaccount was successfully created"
    click_on "Back"
  end

  test "updating a Githubaccount" do
    visit githubaccounts_url
    click_on "Edit", match: :first

    fill_in "Nameowner", with: @githubaccount.nameowner
    fill_in "Person", with: @githubaccount.person_id
    fill_in "Username", with: @githubaccount.username
    click_on "Update Githubaccount"

    assert_text "Githubaccount was successfully updated"
    click_on "Back"
  end

  test "destroying a Githubaccount" do
    visit githubaccounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Githubaccount was successfully destroyed"
  end
end
