require "application_system_test_case"

class FromsomeonegossipsTest < ApplicationSystemTestCase
  setup do
    @fromsomeonegossip = fromsomeonegossips(:one)
  end

  test "visiting the index" do
    visit fromsomeonegossips_url
    assert_selector "h1", text: "Fromsomeonegossips"
  end

  test "creating a Fromsomeonegossip" do
    visit fromsomeonegossips_url
    click_on "New Fromsomeonegossip"

    fill_in "Content", with: @fromsomeonegossip.content
    click_on "Create Fromsomeonegossip"

    assert_text "Fromsomeonegossip was successfully created"
    click_on "Back"
  end

  test "updating a Fromsomeonegossip" do
    visit fromsomeonegossips_url
    click_on "Edit", match: :first

    fill_in "Content", with: @fromsomeonegossip.content
    click_on "Update Fromsomeonegossip"

    assert_text "Fromsomeonegossip was successfully updated"
    click_on "Back"
  end

  test "destroying a Fromsomeonegossip" do
    visit fromsomeonegossips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fromsomeonegossip was successfully destroyed"
  end
end
