require "application_system_test_case"

class FakearticlesTest < ApplicationSystemTestCase
  setup do
    @fakearticle = fakearticles(:one)
  end

  test "visiting the index" do
    visit fakearticles_url
    assert_selector "h1", text: "Fakearticles"
  end

  test "creating a Fakearticle" do
    visit fakearticles_url
    click_on "New Fakearticle"

    fill_in "Authorname", with: @fakearticle.authorname
    fill_in "Authorpic", with: @fakearticle.authorpic
    fill_in "Authorpseudo", with: @fakearticle.authorpseudo
    fill_in "Category", with: @fakearticle.category
    fill_in "Content", with: @fakearticle.content
    fill_in "Pic", with: @fakearticle.pic
    fill_in "Title", with: @fakearticle.title
    click_on "Create Fakearticle"

    assert_text "Fakearticle was successfully created"
    click_on "Back"
  end

  test "updating a Fakearticle" do
    visit fakearticles_url
    click_on "Edit", match: :first

    fill_in "Authorname", with: @fakearticle.authorname
    fill_in "Authorpic", with: @fakearticle.authorpic
    fill_in "Authorpseudo", with: @fakearticle.authorpseudo
    fill_in "Category", with: @fakearticle.category
    fill_in "Content", with: @fakearticle.content
    fill_in "Pic", with: @fakearticle.pic
    fill_in "Title", with: @fakearticle.title
    click_on "Update Fakearticle"

    assert_text "Fakearticle was successfully updated"
    click_on "Back"
  end

  test "destroying a Fakearticle" do
    visit fakearticles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fakearticle was successfully destroyed"
  end
end
