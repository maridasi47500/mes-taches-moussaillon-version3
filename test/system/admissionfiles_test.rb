require "application_system_test_case"

class AdmissionfilesTest < ApplicationSystemTestCase
  setup do
    @admissionfile = admissionfiles(:one)
  end

  test "visiting the index" do
    visit admissionfiles_url
    assert_selector "h1", text: "Admissionfiles"
  end

  test "creating a Admissionfile" do
    visit admissionfiles_url
    click_on "New Admissionfile"

    fill_in "Name", with: @admissionfile.name
    click_on "Create Admissionfile"

    assert_text "Admissionfile was successfully created"
    click_on "Back"
  end

  test "updating a Admissionfile" do
    visit admissionfiles_url
    click_on "Edit", match: :first

    fill_in "Name", with: @admissionfile.name
    click_on "Update Admissionfile"

    assert_text "Admissionfile was successfully updated"
    click_on "Back"
  end

  test "destroying a Admissionfile" do
    visit admissionfiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admissionfile was successfully destroyed"
  end
end
