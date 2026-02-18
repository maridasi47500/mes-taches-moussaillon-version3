require "application_system_test_case"

class CreateBeachesTest < ApplicationSystemTestCase
  setup do
    @create_beach = create_beaches(:one)
  end

  test "visiting the index" do
    visit create_beaches_url
    assert_selector "h1", text: "Create Beaches"
  end

  test "creating a Create beach" do
    visit create_beaches_url
    click_on "New Create Beach"

    fill_in "Address", with: @create_beach.address_id
    fill_in "Name", with: @create_beach.name
    click_on "Create Create beach"

    assert_text "Create beach was successfully created"
    click_on "Back"
  end

  test "updating a Create beach" do
    visit create_beaches_url
    click_on "Edit", match: :first

    fill_in "Address", with: @create_beach.address_id
    fill_in "Name", with: @create_beach.name
    click_on "Update Create beach"

    assert_text "Create beach was successfully updated"
    click_on "Back"
  end

  test "destroying a Create beach" do
    visit create_beaches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Create beach was successfully destroyed"
  end
end
