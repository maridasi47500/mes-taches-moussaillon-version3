require "application_system_test_case"

class HernothersTest < ApplicationSystemTestCase
  setup do
    @hernother = hernothers(:one)
  end

  test "visiting the index" do
    visit hernothers_url
    assert_selector "h1", text: "Hernothers"
  end

  test "creating a Hernother" do
    visit hernothers_url
    click_on "New Hernother"

    fill_in "Otherperson", with: @hernother.otherperson_id
    fill_in "Person", with: @hernother.person_id
    click_on "Create Hernother"

    assert_text "Hernother was successfully created"
    click_on "Back"
  end

  test "updating a Hernother" do
    visit hernothers_url
    click_on "Edit", match: :first

    fill_in "Otherperson", with: @hernother.otherperson_id
    fill_in "Person", with: @hernother.person_id
    click_on "Update Hernother"

    assert_text "Hernother was successfully updated"
    click_on "Back"
  end

  test "destroying a Hernother" do
    visit hernothers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hernother was successfully destroyed"
  end
end
