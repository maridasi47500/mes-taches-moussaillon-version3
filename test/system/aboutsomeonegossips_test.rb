require "application_system_test_case"

class AboutsomeonegossipsTest < ApplicationSystemTestCase
  setup do
    @aboutsomeonegossip = aboutsomeonegossips(:one)
  end

  test "visiting the index" do
    visit aboutsomeonegossips_url
    assert_selector "h1", text: "Aboutsomeonegossips"
  end

  test "creating a Aboutsomeonegossip" do
    visit aboutsomeonegossips_url
    click_on "New Aboutsomeonegossip"

    fill_in "Content", with: @aboutsomeonegossip.content
    click_on "Create Aboutsomeonegossip"

    assert_text "Aboutsomeonegossip was successfully created"
    click_on "Back"
  end

  test "updating a Aboutsomeonegossip" do
    visit aboutsomeonegossips_url
    click_on "Edit", match: :first

    fill_in "Content", with: @aboutsomeonegossip.content
    click_on "Update Aboutsomeonegossip"

    assert_text "Aboutsomeonegossip was successfully updated"
    click_on "Back"
  end

  test "destroying a Aboutsomeonegossip" do
    visit aboutsomeonegossips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aboutsomeonegossip was successfully destroyed"
  end
end
