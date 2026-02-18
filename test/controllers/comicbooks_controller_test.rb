require 'test_helper'

class ComicbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comicbook = comicbooks(:one)
  end

  test "should get index" do
    get comicbooks_url
    assert_response :success
  end

  test "should get new" do
    get new_comicbook_url
    assert_response :success
  end

  test "should create comicbook" do
    assert_difference('Comicbook.count') do
      post comicbooks_url, params: { comicbook: { description: @comicbook.description, image: @comicbook.image, title: @comicbook.title } }
    end

    assert_redirected_to comicbook_url(Comicbook.last)
  end

  test "should show comicbook" do
    get comicbook_url(@comicbook)
    assert_response :success
  end

  test "should get edit" do
    get edit_comicbook_url(@comicbook)
    assert_response :success
  end

  test "should update comicbook" do
    patch comicbook_url(@comicbook), params: { comicbook: { description: @comicbook.description, image: @comicbook.image, title: @comicbook.title } }
    assert_redirected_to comicbook_url(@comicbook)
  end

  test "should destroy comicbook" do
    assert_difference('Comicbook.count', -1) do
      delete comicbook_url(@comicbook)
    end

    assert_redirected_to comicbooks_url
  end
end
