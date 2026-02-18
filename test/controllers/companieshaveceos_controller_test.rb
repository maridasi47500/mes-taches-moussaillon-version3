require 'test_helper'

class CompanieshaveceosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @companieshaveceo = companieshaveceos(:one)
  end

  test "should get index" do
    get companieshaveceos_url
    assert_response :success
  end

  test "should get new" do
    get new_companieshaveceo_url
    assert_response :success
  end

  test "should create companieshaveceo" do
    assert_difference('Companieshaveceo.count') do
      post companieshaveceos_url, params: { companieshaveceo: { ceo_id: @companieshaveceo.ceo_id, company_id: @companieshaveceo.company_id, job_id: @companieshaveceo.job_id, user_id: @companieshaveceo.user_id } }
    end

    assert_redirected_to companieshaveceo_url(Companieshaveceo.last)
  end

  test "should show companieshaveceo" do
    get companieshaveceo_url(@companieshaveceo)
    assert_response :success
  end

  test "should get edit" do
    get edit_companieshaveceo_url(@companieshaveceo)
    assert_response :success
  end

  test "should update companieshaveceo" do
    patch companieshaveceo_url(@companieshaveceo), params: { companieshaveceo: { ceo_id: @companieshaveceo.ceo_id, company_id: @companieshaveceo.company_id, job_id: @companieshaveceo.job_id, user_id: @companieshaveceo.user_id } }
    assert_redirected_to companieshaveceo_url(@companieshaveceo)
  end

  test "should destroy companieshaveceo" do
    assert_difference('Companieshaveceo.count', -1) do
      delete companieshaveceo_url(@companieshaveceo)
    end

    assert_redirected_to companieshaveceos_url
  end
end
