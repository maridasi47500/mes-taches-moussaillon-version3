require 'test_helper'

class AdmissionfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admissionfile = admissionfiles(:one)
  end

  test "should get index" do
    get admissionfiles_url
    assert_response :success
  end

  test "should get new" do
    get new_admissionfile_url
    assert_response :success
  end

  test "should create admissionfile" do
    assert_difference('Admissionfile.count') do
      post admissionfiles_url, params: { admissionfile: { name: @admissionfile.name } }
    end

    assert_redirected_to admissionfile_url(Admissionfile.last)
  end

  test "should show admissionfile" do
    get admissionfile_url(@admissionfile)
    assert_response :success
  end

  test "should get edit" do
    get edit_admissionfile_url(@admissionfile)
    assert_response :success
  end

  test "should update admissionfile" do
    patch admissionfile_url(@admissionfile), params: { admissionfile: { name: @admissionfile.name } }
    assert_redirected_to admissionfile_url(@admissionfile)
  end

  test "should destroy admissionfile" do
    assert_difference('Admissionfile.count', -1) do
      delete admissionfile_url(@admissionfile)
    end

    assert_redirected_to admissionfiles_url
  end
end
