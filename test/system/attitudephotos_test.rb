require "application_system_test_case"

class AttitudephotosTest < ApplicationSystemTestCase
  setup do
    @attitudephoto = attitudephotos(:one)
  end

  test "visiting the index" do
    visit attitudephotos_url
    assert_selector "h1", text: "Attitudephotos"
  end

  test "creating a Attitudephoto" do
    visit attitudephotos_url
    click_on "New Attitudephoto"

    fill_in "End at", with: @attitudephoto.end_at
    fill_in "Start at", with: @attitudephoto.start_at
    fill_in "Title de", with: @attitudephoto.title_de
    fill_in "Title en", with: @attitudephoto.title_en
    fill_in "Title fr", with: @attitudephoto.title_fr
    click_on "Create Attitudephoto"

    assert_text "Attitudephoto was successfully created"
    click_on "Back"
  end

  test "updating a Attitudephoto" do
    visit attitudephotos_url
    click_on "Edit", match: :first

    fill_in "End at", with: @attitudephoto.end_at
    fill_in "Start at", with: @attitudephoto.start_at
    fill_in "Title de", with: @attitudephoto.title_de
    fill_in "Title en", with: @attitudephoto.title_en
    fill_in "Title fr", with: @attitudephoto.title_fr
    click_on "Update Attitudephoto"

    assert_text "Attitudephoto was successfully updated"
    click_on "Back"
  end

  test "destroying a Attitudephoto" do
    visit attitudephotos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attitudephoto was successfully destroyed"
  end
end
