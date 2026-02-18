require "application_system_test_case"

class EndroitsTest < ApplicationSystemTestCase
  setup do
    @endroit = endroits(:one)
  end

  test "visiting the index" do
    visit endroits_url
    assert_selector "h1", text: "Endroits"
  end

  test "creating a Endroit" do
    visit endroits_url
    click_on "New Endroit"

    fill_in "Image", with: @endroit.image
    fill_in "Name", with: @endroit.name
    click_on "Create Endroit"

    assert_text "Endroit was successfully created"
    click_on "Back"
  end

  test "updating a Endroit" do
    visit endroits_url
    click_on "Edit", match: :first

    fill_in "Image", with: @endroit.image
    fill_in "Name", with: @endroit.name
    click_on "Update Endroit"

    assert_text "Endroit was successfully updated"
    click_on "Back"
  end

  test "destroying a Endroit" do
    visit endroits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Endroit was successfully destroyed"
  end
end
