require "application_system_test_case"

class LinguaramisTest < ApplicationSystemTestCase
  setup do
    @linguarami = linguaramis(:one)
  end

  test "visiting the index" do
    visit linguaramis_url
    assert_selector "h1", text: "Linguaramis"
  end

  test "creating a Linguarami" do
    visit linguaramis_url
    click_on "New Linguarami"

    click_on "Create Linguarami"

    assert_text "Linguarami was successfully created"
    click_on "Back"
  end

  test "updating a Linguarami" do
    visit linguaramis_url
    click_on "Edit", match: :first

    click_on "Update Linguarami"

    assert_text "Linguarami was successfully updated"
    click_on "Back"
  end

  test "destroying a Linguarami" do
    visit linguaramis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Linguarami was successfully destroyed"
  end
end
