require 'test_helper'

class PostsSurnameMeaningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posts_surname_meaning = posts_surname_meanings(:one)
  end

  test "should get index" do
    get posts_surname_meanings_url
    assert_response :success
  end

  test "should get new" do
    get new_posts_surname_meaning_url
    assert_response :success
  end

  test "should create posts_surname_meaning" do
    assert_difference('PostsSurnameMeaning.count') do
      post posts_surname_meanings_url, params: { posts_surname_meaning: { action_name: @posts_surname_meaning.action_name, content_de: @posts_surname_meaning.content_de, content_en: @posts_surname_meaning.content_en, content_fr: @posts_surname_meaning.content_fr, destinataire_id: @posts_surname_meaning.destinataire_id, fakename: @posts_surname_meaning.fakename, other_posts_surname_id: @posts_surname_meaning.other_posts_surname_id, person_id: @posts_surname_meaning.person_id, place_id: @posts_surname_meaning.place_id, post_id: @posts_surname_meaning.post_id, posts_surname_id: @posts_surname_meaning.posts_surname_id, profilepic_id: @posts_surname_meaning.profilepic_id, ps_id: @posts_surname_meaning.ps_id, realname_id: @posts_surname_meaning.realname_id, sailor_id: @posts_surname_meaning.sailor_id, speaklike_id: @posts_surname_meaning.speaklike_id, stranger_id: @posts_surname_meaning.stranger_id, surname_id: @posts_surname_meaning.surname_id, surnamedestinataire_id: @posts_surname_meaning.surnamedestinataire_id, thing_id: @posts_surname_meaning.thing_id } }
    end

    assert_redirected_to posts_surname_meaning_url(PostsSurnameMeaning.last)
  end

  test "should show posts_surname_meaning" do
    get posts_surname_meaning_url(@posts_surname_meaning)
    assert_response :success
  end

  test "should get edit" do
    get edit_posts_surname_meaning_url(@posts_surname_meaning)
    assert_response :success
  end

  test "should update posts_surname_meaning" do
    patch posts_surname_meaning_url(@posts_surname_meaning), params: { posts_surname_meaning: { action_name: @posts_surname_meaning.action_name, content_de: @posts_surname_meaning.content_de, content_en: @posts_surname_meaning.content_en, content_fr: @posts_surname_meaning.content_fr, destinataire_id: @posts_surname_meaning.destinataire_id, fakename: @posts_surname_meaning.fakename, other_posts_surname_id: @posts_surname_meaning.other_posts_surname_id, person_id: @posts_surname_meaning.person_id, place_id: @posts_surname_meaning.place_id, post_id: @posts_surname_meaning.post_id, posts_surname_id: @posts_surname_meaning.posts_surname_id, profilepic_id: @posts_surname_meaning.profilepic_id, ps_id: @posts_surname_meaning.ps_id, realname_id: @posts_surname_meaning.realname_id, sailor_id: @posts_surname_meaning.sailor_id, speaklike_id: @posts_surname_meaning.speaklike_id, stranger_id: @posts_surname_meaning.stranger_id, surname_id: @posts_surname_meaning.surname_id, surnamedestinataire_id: @posts_surname_meaning.surnamedestinataire_id, thing_id: @posts_surname_meaning.thing_id } }
    assert_redirected_to posts_surname_meaning_url(@posts_surname_meaning)
  end

  test "should destroy posts_surname_meaning" do
    assert_difference('PostsSurnameMeaning.count', -1) do
      delete posts_surname_meaning_url(@posts_surname_meaning)
    end

    assert_redirected_to posts_surname_meanings_url
  end
end
