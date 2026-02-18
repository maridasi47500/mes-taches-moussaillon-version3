require "application_system_test_case"

class CompanieshavecustomersTest < ApplicationSystemTestCase
  setup do
    @companieshavecustomer = companieshavecustomers(:one)
  end

  test "visiting the index" do
    visit companieshavecustomers_url
    assert_selector "h1", text: "Companieshavecustomers"
  end

  test "creating a Companieshavecustomer" do
    visit companieshavecustomers_url
    click_on "New Companieshavecustomer"

    fill_in "Company", with: @companieshavecustomer.company_id
    fill_in "Customer", with: @companieshavecustomer.customer_id
    fill_in "Employee", with: @companieshavecustomer.employee_id
    fill_in "User", with: @companieshavecustomer.user_id
    click_on "Create Companieshavecustomer"

    assert_text "Companieshavecustomer was successfully created"
    click_on "Back"
  end

  test "updating a Companieshavecustomer" do
    visit companieshavecustomers_url
    click_on "Edit", match: :first

    fill_in "Company", with: @companieshavecustomer.company_id
    fill_in "Customer", with: @companieshavecustomer.customer_id
    fill_in "Employee", with: @companieshavecustomer.employee_id
    fill_in "User", with: @companieshavecustomer.user_id
    click_on "Update Companieshavecustomer"

    assert_text "Companieshavecustomer was successfully updated"
    click_on "Back"
  end

  test "destroying a Companieshavecustomer" do
    visit companieshavecustomers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Companieshavecustomer was successfully destroyed"
  end
end
