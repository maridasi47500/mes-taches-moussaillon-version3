require 'test_helper'

class SalutmilitairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salutmilitaire = salutmilitaires(:one)
  end

  test "should get index" do
    get salutmilitaires_url
    assert_response :success
  end

  test "should get new" do
    get new_salutmilitaire_url
    assert_response :success
  end

  test "should create salutmilitaire" do
    assert_difference('Salutmilitaire.count') do
      post salutmilitaires_url, params: { salutmilitaire: { tickets_attributes: @salutmilitaire.tickets_attributes } }
    end

    assert_redirected_to salutmilitaire_url(Salutmilitaire.last)
  end

  test "should show salutmilitaire" do
    get salutmilitaire_url(@salutmilitaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_salutmilitaire_url(@salutmilitaire)
    assert_response :success
  end

  test "should update salutmilitaire" do
    patch salutmilitaire_url(@salutmilitaire), params: { salutmilitaire: { tickets_attributes: @salutmilitaire.tickets_attributes } }
    assert_redirected_to salutmilitaire_url(@salutmilitaire)
  end

  test "should destroy salutmilitaire" do
    assert_difference('Salutmilitaire.count', -1) do
      delete salutmilitaire_url(@salutmilitaire)
    end

    assert_redirected_to salutmilitaires_url
  end
end
