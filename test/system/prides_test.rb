require "application_system_test_case"

class PridesTest < ApplicationSystemTestCase
  setup do
    @pride = prides(:one)
  end

  test "visiting the index" do
    visit prides_url
    assert_selector "h1", text: "Prides"
  end

  test "creating a Pride" do
    visit prides_url
    click_on "New Pride"

    fill_in "Content de", with: @pride.content_de
    fill_in "Content en", with: @pride.content_en
    fill_in "Content fr", with: @pride.content_fr
    click_on "Create Pride"

    assert_text "Pride was successfully created"
    click_on "Back"
  end

  test "updating a Pride" do
    visit prides_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @pride.content_de
    fill_in "Content en", with: @pride.content_en
    fill_in "Content fr", with: @pride.content_fr
    click_on "Update Pride"

    assert_text "Pride was successfully updated"
    click_on "Back"
  end

  test "destroying a Pride" do
    visit prides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pride was successfully destroyed"
  end
end
