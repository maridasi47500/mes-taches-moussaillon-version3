require "application_system_test_case"

class ComputingstuffsTest < ApplicationSystemTestCase
  setup do
    @computingstuff = computingstuffs(:one)
  end

  test "visiting the index" do
    visit computingstuffs_url
    assert_selector "h1", text: "Computingstuffs"
  end

  test "creating a Computingstuff" do
    visit computingstuffs_url
    click_on "New Computingstuff"

    fill_in "Image", with: @computingstuff.image
    fill_in "Name", with: @computingstuff.name
    click_on "Create Computingstuff"

    assert_text "Computingstuff was successfully created"
    click_on "Back"
  end

  test "updating a Computingstuff" do
    visit computingstuffs_url
    click_on "Edit", match: :first

    fill_in "Image", with: @computingstuff.image
    fill_in "Name", with: @computingstuff.name
    click_on "Update Computingstuff"

    assert_text "Computingstuff was successfully updated"
    click_on "Back"
  end

  test "destroying a Computingstuff" do
    visit computingstuffs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Computingstuff was successfully destroyed"
  end
end
