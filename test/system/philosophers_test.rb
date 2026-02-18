require "application_system_test_case"

class PhilosophersTest < ApplicationSystemTestCase
  setup do
    @philosopher = philosophers(:one)
  end

  test "visiting the index" do
    visit philosophers_url
    assert_selector "h1", text: "Philosophers"
  end

  test "creating a Philosopher" do
    visit philosophers_url
    click_on "New Philosopher"

    fill_in "Image", with: @philosopher.image
    fill_in "Name", with: @philosopher.name
    click_on "Create Philosopher"

    assert_text "Philosopher was successfully created"
    click_on "Back"
  end

  test "updating a Philosopher" do
    visit philosophers_url
    click_on "Edit", match: :first

    fill_in "Image", with: @philosopher.image
    fill_in "Name", with: @philosopher.name
    click_on "Update Philosopher"

    assert_text "Philosopher was successfully updated"
    click_on "Back"
  end

  test "destroying a Philosopher" do
    visit philosophers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Philosopher was successfully destroyed"
  end
end
