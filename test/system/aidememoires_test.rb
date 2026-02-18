require "application_system_test_case"

class AidememoiresTest < ApplicationSystemTestCase
  setup do
    @aidememoire = aidememoires(:one)
  end

  test "visiting the index" do
    visit aidememoires_url
    assert_selector "h1", text: "Aidememoires"
  end

  test "creating a Aidememoire" do
    visit aidememoires_url
    click_on "New Aidememoire"

    fill_in "Recordingphrase", with: @aidememoire.recordingphrase_id
    fill_in "Recordingword", with: @aidememoire.recordingword_id
    click_on "Create Aidememoire"

    assert_text "Aidememoire was successfully created"
    click_on "Back"
  end

  test "updating a Aidememoire" do
    visit aidememoires_url
    click_on "Edit", match: :first

    fill_in "Recordingphrase", with: @aidememoire.recordingphrase_id
    fill_in "Recordingword", with: @aidememoire.recordingword_id
    click_on "Update Aidememoire"

    assert_text "Aidememoire was successfully updated"
    click_on "Back"
  end

  test "destroying a Aidememoire" do
    visit aidememoires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aidememoire was successfully destroyed"
  end
end
