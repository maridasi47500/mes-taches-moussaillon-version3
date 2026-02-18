require "application_system_test_case"

class FactoriesTest < ApplicationSystemTestCase
  setup do
    @factory = factories(:one)
  end

  test "visiting the index" do
    visit factories_url
    assert_selector "h1", text: "Factories"
  end

  test "creating a Factory" do
    visit factories_url
    click_on "New Factory"

    fill_in "Image", with: @factory.image
    fill_in "Name de", with: @factory.name_de
    fill_in "Name en", with: @factory.name_en
    fill_in "Name fr", with: @factory.name_fr
    click_on "Create Factory"

    assert_text "Factory was successfully created"
    click_on "Back"
  end

  test "updating a Factory" do
    visit factories_url
    click_on "Edit", match: :first

    fill_in "Image", with: @factory.image
    fill_in "Name de", with: @factory.name_de
    fill_in "Name en", with: @factory.name_en
    fill_in "Name fr", with: @factory.name_fr
    click_on "Update Factory"

    assert_text "Factory was successfully updated"
    click_on "Back"
  end

  test "destroying a Factory" do
    visit factories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Factory was successfully destroyed"
  end
end
