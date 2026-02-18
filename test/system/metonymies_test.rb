require "application_system_test_case"

class MetonymiesTest < ApplicationSystemTestCase
  setup do
    @metonymy = metonymies(:one)
  end

  test "visiting the index" do
    visit metonymies_url
    assert_selector "h1", text: "Metonymies"
  end

  test "creating a Metonymy" do
    visit metonymies_url
    click_on "New Metonymy"

    fill_in "Name", with: @metonymy.name
    fill_in "Post", with: @metonymy.post_id
    fill_in "Thing", with: @metonymy.thing_id
    click_on "Create Metonymy"

    assert_text "Metonymy was successfully created"
    click_on "Back"
  end

  test "updating a Metonymy" do
    visit metonymies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @metonymy.name
    fill_in "Post", with: @metonymy.post_id
    fill_in "Thing", with: @metonymy.thing_id
    click_on "Update Metonymy"

    assert_text "Metonymy was successfully updated"
    click_on "Back"
  end

  test "destroying a Metonymy" do
    visit metonymies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Metonymy was successfully destroyed"
  end
end
