require "application_system_test_case"

class GithubreposTest < ApplicationSystemTestCase
  setup do
    @githubrepo = githubrepos(:one)
  end

  test "visiting the index" do
    visit githubrepos_url
    assert_selector "h1", text: "Githubrepos"
  end

  test "creating a Githubrepo" do
    visit githubrepos_url
    click_on "New Githubrepo"

    fill_in "Githubrepo", with: @githubrepo.githubrepo_id
    fill_in "Name", with: @githubrepo.name
    click_on "Create Githubrepo"

    assert_text "Githubrepo was successfully created"
    click_on "Back"
  end

  test "updating a Githubrepo" do
    visit githubrepos_url
    click_on "Edit", match: :first

    fill_in "Githubrepo", with: @githubrepo.githubrepo_id
    fill_in "Name", with: @githubrepo.name
    click_on "Update Githubrepo"

    assert_text "Githubrepo was successfully updated"
    click_on "Back"
  end

  test "destroying a Githubrepo" do
    visit githubrepos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Githubrepo was successfully destroyed"
  end
end
