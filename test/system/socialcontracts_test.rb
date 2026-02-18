require "application_system_test_case"

class SocialcontractsTest < ApplicationSystemTestCase
  setup do
    @socialcontract = socialcontracts(:one)
  end

  test "visiting the index" do
    visit socialcontracts_url
    assert_selector "h1", text: "Socialcontracts"
  end

  test "creating a Socialcontract" do
    visit socialcontracts_url
    click_on "New Socialcontract"

    fill_in "Otherperson", with: @socialcontract.otherperson_id
    fill_in "Person", with: @socialcontract.person_id
    click_on "Create Socialcontract"

    assert_text "Socialcontract was successfully created"
    click_on "Back"
  end

  test "updating a Socialcontract" do
    visit socialcontracts_url
    click_on "Edit", match: :first

    fill_in "Otherperson", with: @socialcontract.otherperson_id
    fill_in "Person", with: @socialcontract.person_id
    click_on "Update Socialcontract"

    assert_text "Socialcontract was successfully updated"
    click_on "Back"
  end

  test "destroying a Socialcontract" do
    visit socialcontracts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Socialcontract was successfully destroyed"
  end
end
