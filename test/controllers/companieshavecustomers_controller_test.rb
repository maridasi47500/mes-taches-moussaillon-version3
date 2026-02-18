require 'test_helper'

class CompanieshavecustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @companieshavecustomer = companieshavecustomers(:one)
  end

  test "should get index" do
    get companieshavecustomers_url
    assert_response :success
  end

  test "should get new" do
    get new_companieshavecustomer_url
    assert_response :success
  end

  test "should create companieshavecustomer" do
    assert_difference('Companieshavecustomer.count') do
      post companieshavecustomers_url, params: { companieshavecustomer: { company_id: @companieshavecustomer.company_id, customer_id: @companieshavecustomer.customer_id, employee_id: @companieshavecustomer.employee_id, user_id: @companieshavecustomer.user_id } }
    end

    assert_redirected_to companieshavecustomer_url(Companieshavecustomer.last)
  end

  test "should show companieshavecustomer" do
    get companieshavecustomer_url(@companieshavecustomer)
    assert_response :success
  end

  test "should get edit" do
    get edit_companieshavecustomer_url(@companieshavecustomer)
    assert_response :success
  end

  test "should update companieshavecustomer" do
    patch companieshavecustomer_url(@companieshavecustomer), params: { companieshavecustomer: { company_id: @companieshavecustomer.company_id, customer_id: @companieshavecustomer.customer_id, employee_id: @companieshavecustomer.employee_id, user_id: @companieshavecustomer.user_id } }
    assert_redirected_to companieshavecustomer_url(@companieshavecustomer)
  end

  test "should destroy companieshavecustomer" do
    assert_difference('Companieshavecustomer.count', -1) do
      delete companieshavecustomer_url(@companieshavecustomer)
    end

    assert_redirected_to companieshavecustomers_url
  end
end
