require 'test_helper'

class FakecommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fakecomment = fakecomments(:one)
  end

  test "should get index" do
    get fakecomments_url
    assert_response :success
  end

  test "should get new" do
    get new_fakecomment_url
    assert_response :success
  end

  test "should create fakecomment" do
    assert_difference('Fakecomment.count') do
      post fakecomments_url, params: { fakecomment: { author: @fakecomment.author, content: @fakecomment.content } }
    end

    assert_redirected_to fakecomment_url(Fakecomment.last)
  end

  test "should show fakecomment" do
    get fakecomment_url(@fakecomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_fakecomment_url(@fakecomment)
    assert_response :success
  end

  test "should update fakecomment" do
    patch fakecomment_url(@fakecomment), params: { fakecomment: { author: @fakecomment.author, content: @fakecomment.content } }
    assert_redirected_to fakecomment_url(@fakecomment)
  end

  test "should destroy fakecomment" do
    assert_difference('Fakecomment.count', -1) do
      delete fakecomment_url(@fakecomment)
    end

    assert_redirected_to fakecomments_url
  end
end
