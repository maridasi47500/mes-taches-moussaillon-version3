require "application_system_test_case"

class SynonymsTest < ApplicationSystemTestCase
  setup do
    @synonym = synonyms(:one)
  end

  test "visiting the index" do
    visit synonyms_url
    assert_selector "h1", text: "Synonyms"
  end

  test "creating a Synonym" do
    visit synonyms_url
    click_on "New Synonym"

    fill_in "Content", with: @synonym.content
    fill_in "Synonym", with: @synonym.synonym_id
    click_on "Create Synonym"

    assert_text "Synonym was successfully created"
    click_on "Back"
  end

  test "updating a Synonym" do
    visit synonyms_url
    click_on "Edit", match: :first

    fill_in "Content", with: @synonym.content
    fill_in "Synonym", with: @synonym.synonym_id
    click_on "Update Synonym"

    assert_text "Synonym was successfully updated"
    click_on "Back"
  end

  test "destroying a Synonym" do
    visit synonyms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Synonym was successfully destroyed"
  end
end
