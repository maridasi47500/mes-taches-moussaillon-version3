require "application_system_test_case"

class SecretquestionsTest < ApplicationSystemTestCase
  setup do
    @secretquestion = secretquestions(:one)
  end

  test "visiting the index" do
    visit secretquestions_url
    assert_selector "h1", text: "Secretquestions"
  end

  test "creating a Secretquestion" do
    visit secretquestions_url
    click_on "New Secretquestion"

    fill_in "Text", with: @secretquestion.text
    fill_in "Typeq", with: @secretquestion.typeq
    click_on "Create Secretquestion"

    assert_text "Secretquestion was successfully created"
    click_on "Back"
  end

  test "updating a Secretquestion" do
    visit secretquestions_url
    click_on "Edit", match: :first

    fill_in "Text", with: @secretquestion.text
    fill_in "Typeq", with: @secretquestion.typeq
    click_on "Update Secretquestion"

    assert_text "Secretquestion was successfully updated"
    click_on "Back"
  end

  test "destroying a Secretquestion" do
    visit secretquestions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Secretquestion was successfully destroyed"
  end
end
