require "application_system_test_case"

class RequeststopeopleTest < ApplicationSystemTestCase
  setup do
    @requeststoperson = requeststopeople(:one)
  end

  test "visiting the index" do
    visit requeststopeople_url
    assert_selector "h1", text: "Requeststopeople"
  end

  test "creating a Requeststoperson" do
    visit requeststopeople_url
    click_on "New Requeststoperson"

    fill_in "Content de", with: @requeststoperson.content_de
    fill_in "Content en", with: @requeststoperson.content_en
    fill_in "Content fr", with: @requeststoperson.content_fr
    fill_in "Requestperson", with: @requeststoperson.requestperson_id
    click_on "Create Requeststoperson"

    assert_text "Requeststoperson was successfully created"
    click_on "Back"
  end

  test "updating a Requeststoperson" do
    visit requeststopeople_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @requeststoperson.content_de
    fill_in "Content en", with: @requeststoperson.content_en
    fill_in "Content fr", with: @requeststoperson.content_fr
    fill_in "Requestperson", with: @requeststoperson.requestperson_id
    click_on "Update Requeststoperson"

    assert_text "Requeststoperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Requeststoperson" do
    visit requeststopeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Requeststoperson was successfully destroyed"
  end
end
