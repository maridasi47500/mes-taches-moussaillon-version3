require "application_system_test_case"

class CompanieshaveceosTest < ApplicationSystemTestCase
  setup do
    @companieshaveceo = companieshaveceos(:one)
  end

  test "visiting the index" do
    visit companieshaveceos_url
    assert_selector "h1", text: "Companieshaveceos"
  end

  test "creating a Companieshaveceo" do
    visit companieshaveceos_url
    click_on "New Companieshaveceo"

    fill_in "Ceo", with: @companieshaveceo.ceo_id
    fill_in "Company", with: @companieshaveceo.company_id
    fill_in "Job", with: @companieshaveceo.job_id
    fill_in "User", with: @companieshaveceo.user_id
    click_on "Create Companieshaveceo"

    assert_text "Companieshaveceo was successfully created"
    click_on "Back"
  end

  test "updating a Companieshaveceo" do
    visit companieshaveceos_url
    click_on "Edit", match: :first

    fill_in "Ceo", with: @companieshaveceo.ceo_id
    fill_in "Company", with: @companieshaveceo.company_id
    fill_in "Job", with: @companieshaveceo.job_id
    fill_in "User", with: @companieshaveceo.user_id
    click_on "Update Companieshaveceo"

    assert_text "Companieshaveceo was successfully updated"
    click_on "Back"
  end

  test "destroying a Companieshaveceo" do
    visit companieshaveceos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Companieshaveceo was successfully destroyed"
  end
end
