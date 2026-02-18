require 'test_helper'

class EmoticonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emoticon = emoticons(:one)
  end

  test "should get index" do
    get emoticons_url
    assert_response :success
  end

  test "should get new" do
    get new_emoticon_url
    assert_response :success
  end

  test "should create emoticon" do
    assert_difference('Emoticon.count') do
      post emoticons_url, params: { emoticon: { image: @emoticon.image, title: @emoticon.title } }
    end

    assert_redirected_to emoticon_url(Emoticon.last)
  end

  test "should show emoticon" do
    get emoticon_url(@emoticon)
    assert_response :success
  end

  test "should get edit" do
    get edit_emoticon_url(@emoticon)
    assert_response :success
  end

  test "should update emoticon" do
    patch emoticon_url(@emoticon), params: { emoticon: { image: @emoticon.image, title: @emoticon.title } }
    assert_redirected_to emoticon_url(@emoticon)
  end

  test "should destroy emoticon" do
    assert_difference('Emoticon.count', -1) do
      delete emoticon_url(@emoticon)
    end

    assert_redirected_to emoticons_url
  end
end
