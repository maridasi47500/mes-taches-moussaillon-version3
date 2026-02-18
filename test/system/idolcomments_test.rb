require "application_system_test_case"

class IdolcommentsTest < ApplicationSystemTestCase
  setup do
    @idolcomment = idolcomments(:one)
  end

  test "visiting the index" do
    visit idolcomments_url
    assert_selector "h1", text: "Idolcomments"
  end

  test "creating a Idolcomment" do
    visit idolcomments_url
    click_on "New Idolcomment"

    fill_in "Alias", with: @idolcomment.alias_id
    fill_in "Content de", with: @idolcomment.content_de
    fill_in "Content en", with: @idolcomment.content_en
    fill_in "Content fr", with: @idolcomment.content_fr
    fill_in "Tvserieshaveactor", with: @idolcomment.tvserieshaveactor_id
    click_on "Create Idolcomment"

    assert_text "Idolcomment was successfully created"
    click_on "Back"
  end

  test "updating a Idolcomment" do
    visit idolcomments_url
    click_on "Edit", match: :first

    fill_in "Alias", with: @idolcomment.alias_id
    fill_in "Content de", with: @idolcomment.content_de
    fill_in "Content en", with: @idolcomment.content_en
    fill_in "Content fr", with: @idolcomment.content_fr
    fill_in "Tvserieshaveactor", with: @idolcomment.tvserieshaveactor_id
    click_on "Update Idolcomment"

    assert_text "Idolcomment was successfully updated"
    click_on "Back"
  end

  test "destroying a Idolcomment" do
    visit idolcomments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Idolcomment was successfully destroyed"
  end
end
