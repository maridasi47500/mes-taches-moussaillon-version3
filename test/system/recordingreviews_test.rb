require "application_system_test_case"

class RecordingreviewsTest < ApplicationSystemTestCase
  setup do
    @recordingreview = recordingreviews(:one)
  end

  test "visiting the index" do
    visit recordingreviews_url
    assert_selector "h1", text: "Recordingreviews"
  end

  test "creating a Recordingreview" do
    visit recordingreviews_url
    click_on "New Recordingreview"

    fill_in "Correctsampleid", with: @recordingreview.correctsampleid
    fill_in "Gooduser", with: @recordingreview.gooduser_id
    fill_in "Incorrectsample", with: @recordingreview.incorrectsample_id
    click_on "Create Recordingreview"

    assert_text "Recordingreview was successfully created"
    click_on "Back"
  end

  test "updating a Recordingreview" do
    visit recordingreviews_url
    click_on "Edit", match: :first

    fill_in "Correctsampleid", with: @recordingreview.correctsampleid
    fill_in "Gooduser", with: @recordingreview.gooduser_id
    fill_in "Incorrectsample", with: @recordingreview.incorrectsample_id
    click_on "Update Recordingreview"

    assert_text "Recordingreview was successfully updated"
    click_on "Back"
  end

  test "destroying a Recordingreview" do
    visit recordingreviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recordingreview was successfully destroyed"
  end
end
