require "application_system_test_case"

class PostsSurnameMeaningsTest < ApplicationSystemTestCase
  setup do
    @posts_surname_meaning = posts_surname_meanings(:one)
  end

  test "visiting the index" do
    visit posts_surname_meanings_url
    assert_selector "h1", text: "Posts Surname Meanings"
  end

  test "creating a Posts surname meaning" do
    visit posts_surname_meanings_url
    click_on "New Posts Surname Meaning"

    fill_in "Action name", with: @posts_surname_meaning.action_name
    fill_in "Content de", with: @posts_surname_meaning.content_de
    fill_in "Content en", with: @posts_surname_meaning.content_en
    fill_in "Content fr", with: @posts_surname_meaning.content_fr
    fill_in "Destinataire", with: @posts_surname_meaning.destinataire_id
    fill_in "Fakename", with: @posts_surname_meaning.fakename
    fill_in "Other posts surname", with: @posts_surname_meaning.other_posts_surname_id
    fill_in "Person", with: @posts_surname_meaning.person_id
    fill_in "Place", with: @posts_surname_meaning.place_id
    fill_in "Post", with: @posts_surname_meaning.post_id
    fill_in "Posts surname", with: @posts_surname_meaning.posts_surname_id
    fill_in "Profilepic", with: @posts_surname_meaning.profilepic_id
    fill_in "Ps", with: @posts_surname_meaning.ps_id
    fill_in "Realname", with: @posts_surname_meaning.realname_id
    fill_in "Sailor", with: @posts_surname_meaning.sailor_id
    fill_in "Speaklike", with: @posts_surname_meaning.speaklike_id
    fill_in "Stranger", with: @posts_surname_meaning.stranger_id
    fill_in "Surname", with: @posts_surname_meaning.surname_id
    fill_in "Surnamedestinataire", with: @posts_surname_meaning.surnamedestinataire_id
    fill_in "Thing", with: @posts_surname_meaning.thing_id
    click_on "Create Posts surname meaning"

    assert_text "Posts surname meaning was successfully created"
    click_on "Back"
  end

  test "updating a Posts surname meaning" do
    visit posts_surname_meanings_url
    click_on "Edit", match: :first

    fill_in "Action name", with: @posts_surname_meaning.action_name
    fill_in "Content de", with: @posts_surname_meaning.content_de
    fill_in "Content en", with: @posts_surname_meaning.content_en
    fill_in "Content fr", with: @posts_surname_meaning.content_fr
    fill_in "Destinataire", with: @posts_surname_meaning.destinataire_id
    fill_in "Fakename", with: @posts_surname_meaning.fakename
    fill_in "Other posts surname", with: @posts_surname_meaning.other_posts_surname_id
    fill_in "Person", with: @posts_surname_meaning.person_id
    fill_in "Place", with: @posts_surname_meaning.place_id
    fill_in "Post", with: @posts_surname_meaning.post_id
    fill_in "Posts surname", with: @posts_surname_meaning.posts_surname_id
    fill_in "Profilepic", with: @posts_surname_meaning.profilepic_id
    fill_in "Ps", with: @posts_surname_meaning.ps_id
    fill_in "Realname", with: @posts_surname_meaning.realname_id
    fill_in "Sailor", with: @posts_surname_meaning.sailor_id
    fill_in "Speaklike", with: @posts_surname_meaning.speaklike_id
    fill_in "Stranger", with: @posts_surname_meaning.stranger_id
    fill_in "Surname", with: @posts_surname_meaning.surname_id
    fill_in "Surnamedestinataire", with: @posts_surname_meaning.surnamedestinataire_id
    fill_in "Thing", with: @posts_surname_meaning.thing_id
    click_on "Update Posts surname meaning"

    assert_text "Posts surname meaning was successfully updated"
    click_on "Back"
  end

  test "destroying a Posts surname meaning" do
    visit posts_surname_meanings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Posts surname meaning was successfully destroyed"
  end
end
