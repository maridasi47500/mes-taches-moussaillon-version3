require 'test_helper'

class PersonhavelifestateshavephotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personhavelifestateshavephoto = personhavelifestateshavephotos(:one)
  end

  test "should get index" do
    get personhavelifestateshavephotos_url
    assert_response :success
  end

  test "should get new" do
    get new_personhavelifestateshavephoto_url
    assert_response :success
  end

  test "should create personhavelifestateshavephoto" do
    assert_difference('Personhavelifestateshavephoto.count') do
      post personhavelifestateshavephotos_url, params: { personhavelifestateshavephoto: { personhavelifestate_id: @personhavelifestateshavephoto.personhavelifestate_id, photo_id: @personhavelifestateshavephoto.photo_id } }
    end

    assert_redirected_to personhavelifestateshavephoto_url(Personhavelifestateshavephoto.last)
  end

  test "should show personhavelifestateshavephoto" do
    get personhavelifestateshavephoto_url(@personhavelifestateshavephoto)
    assert_response :success
  end

  test "should get edit" do
    get edit_personhavelifestateshavephoto_url(@personhavelifestateshavephoto)
    assert_response :success
  end

  test "should update personhavelifestateshavephoto" do
    patch personhavelifestateshavephoto_url(@personhavelifestateshavephoto), params: { personhavelifestateshavephoto: { personhavelifestate_id: @personhavelifestateshavephoto.personhavelifestate_id, photo_id: @personhavelifestateshavephoto.photo_id } }
    assert_redirected_to personhavelifestateshavephoto_url(@personhavelifestateshavephoto)
  end

  test "should destroy personhavelifestateshavephoto" do
    assert_difference('Personhavelifestateshavephoto.count', -1) do
      delete personhavelifestateshavephoto_url(@personhavelifestateshavephoto)
    end

    assert_redirected_to personhavelifestateshavephotos_url
  end
end
