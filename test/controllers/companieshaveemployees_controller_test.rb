require 'test_helper'

class CompanieshaveemployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @companieshaveemployee = companieshaveemployees(:one)
  end

  test "should get index" do
    get companieshaveemployees_url
    assert_response :success
  end

  test "should get new" do
    get new_companieshaveemployee_url
    assert_response :success
  end

  test "should create companieshaveemployee" do
    assert_difference('Companieshaveemployee.count') do
      post companieshaveemployees_url, params: { companieshaveemployee: { company_id: @companieshaveemployee.company_id, employee_id: @companieshaveemployee.employee_id, employer_id: @companieshaveemployee.employer_id, job_id: @companieshaveemployee.job_id, user_id: @companieshaveemployee.user_id } }
    end

    assert_redirected_to companieshaveemployee_url(Companieshaveemployee.last)
  end

  test "should show companieshaveemployee" do
    get companieshaveemployee_url(@companieshaveemployee)
    assert_response :success
  end

  test "should get edit" do
    get edit_companieshaveemployee_url(@companieshaveemployee)
    assert_response :success
  end

  test "should update companieshaveemployee" do
    patch companieshaveemployee_url(@companieshaveemployee), params: { companieshaveemployee: { company_id: @companieshaveemployee.company_id, employee_id: @companieshaveemployee.employee_id, employer_id: @companieshaveemployee.employer_id, job_id: @companieshaveemployee.job_id, user_id: @companieshaveemployee.user_id } }
    assert_redirected_to companieshaveemployee_url(@companieshaveemployee)
  end

  test "should destroy companieshaveemployee" do
    assert_difference('Companieshaveemployee.count', -1) do
      delete companieshaveemployee_url(@companieshaveemployee)
    end

    assert_redirected_to companieshaveemployees_url
  end
end
