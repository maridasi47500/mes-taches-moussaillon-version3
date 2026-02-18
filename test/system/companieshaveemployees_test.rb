require "application_system_test_case"

class CompanieshaveemployeesTest < ApplicationSystemTestCase
  setup do
    @companieshaveemployee = companieshaveemployees(:one)
  end

  test "visiting the index" do
    visit companieshaveemployees_url
    assert_selector "h1", text: "Companieshaveemployees"
  end

  test "creating a Companieshaveemployee" do
    visit companieshaveemployees_url
    click_on "New Companieshaveemployee"

    fill_in "Company", with: @companieshaveemployee.company_id
    fill_in "Employee", with: @companieshaveemployee.employee_id
    fill_in "Employer", with: @companieshaveemployee.employer_id
    fill_in "Job", with: @companieshaveemployee.job_id
    fill_in "User", with: @companieshaveemployee.user_id
    click_on "Create Companieshaveemployee"

    assert_text "Companieshaveemployee was successfully created"
    click_on "Back"
  end

  test "updating a Companieshaveemployee" do
    visit companieshaveemployees_url
    click_on "Edit", match: :first

    fill_in "Company", with: @companieshaveemployee.company_id
    fill_in "Employee", with: @companieshaveemployee.employee_id
    fill_in "Employer", with: @companieshaveemployee.employer_id
    fill_in "Job", with: @companieshaveemployee.job_id
    fill_in "User", with: @companieshaveemployee.user_id
    click_on "Update Companieshaveemployee"

    assert_text "Companieshaveemployee was successfully updated"
    click_on "Back"
  end

  test "destroying a Companieshaveemployee" do
    visit companieshaveemployees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Companieshaveemployee was successfully destroyed"
  end
end
