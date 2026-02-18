require "application_system_test_case"

class BodydescriptionsTest < ApplicationSystemTestCase
  setup do
    @bodydescription = bodydescriptions(:one)
  end

  test "visiting the index" do
    visit bodydescriptions_url
    assert_selector "h1", text: "Bodydescriptions"
  end

  test "creating a Bodydescription" do
    visit bodydescriptions_url
    click_on "New Bodydescription"

    fill_in "Name", with: @bodydescription.name
    click_on "Create Bodydescription"

    assert_text "Bodydescription was successfully created"
    click_on "Back"
  end

  test "updating a Bodydescription" do
    visit bodydescriptions_url
    click_on "Edit", match: :first

    fill_in "Name", with: @bodydescription.name
    click_on "Update Bodydescription"

    assert_text "Bodydescription was successfully updated"
    click_on "Back"
  end

  test "destroying a Bodydescription" do
    visit bodydescriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bodydescription was successfully destroyed"
  end
end
