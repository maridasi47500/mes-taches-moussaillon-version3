require "application_system_test_case"

class ShaktistatementsTest < ApplicationSystemTestCase
  setup do
    @shaktistatement = shaktistatements(:one)
  end

  test "visiting the index" do
    visit shaktistatements_url
    assert_selector "h1", text: "Shaktistatements"
  end

  test "creating a Shaktistatement" do
    visit shaktistatements_url
    click_on "New Shaktistatement"

    fill_in "Content de", with: @shaktistatement.content_de
    fill_in "Content en", with: @shaktistatement.content_en
    fill_in "Content fr", with: @shaktistatement.content_fr
    click_on "Create Shaktistatement"

    assert_text "Shaktistatement was successfully created"
    click_on "Back"
  end

  test "updating a Shaktistatement" do
    visit shaktistatements_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @shaktistatement.content_de
    fill_in "Content en", with: @shaktistatement.content_en
    fill_in "Content fr", with: @shaktistatement.content_fr
    click_on "Update Shaktistatement"

    assert_text "Shaktistatement was successfully updated"
    click_on "Back"
  end

  test "destroying a Shaktistatement" do
    visit shaktistatements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shaktistatement was successfully destroyed"
  end
end
