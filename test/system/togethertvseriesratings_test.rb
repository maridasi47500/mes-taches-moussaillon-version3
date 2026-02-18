require "application_system_test_case"

class TogethertvseriesratingsTest < ApplicationSystemTestCase
  setup do
    @togethertvseriesrating = togethertvseriesratings(:one)
  end

  test "visiting the index" do
    visit togethertvseriesratings_url
    assert_selector "h1", text: "Togethertvseriesratings"
  end

  test "creating a Togethertvseriesrating" do
    visit togethertvseriesratings_url
    click_on "New Togethertvseriesrating"

    fill_in "Content de", with: @togethertvseriesrating.content_de
    fill_in "Content en", with: @togethertvseriesrating.content_en
    fill_in "Content fr", with: @togethertvseriesrating.content_fr
    fill_in "Rating", with: @togethertvseriesrating.rating
    fill_in "Tvserieshaveactor", with: @togethertvseriesrating.tvserieshaveactor_id
    fill_in "User", with: @togethertvseriesrating.user_id
    click_on "Create Togethertvseriesrating"

    assert_text "Togethertvseriesrating was successfully created"
    click_on "Back"
  end

  test "updating a Togethertvseriesrating" do
    visit togethertvseriesratings_url
    click_on "Edit", match: :first

    fill_in "Content de", with: @togethertvseriesrating.content_de
    fill_in "Content en", with: @togethertvseriesrating.content_en
    fill_in "Content fr", with: @togethertvseriesrating.content_fr
    fill_in "Rating", with: @togethertvseriesrating.rating
    fill_in "Tvserieshaveactor", with: @togethertvseriesrating.tvserieshaveactor_id
    fill_in "User", with: @togethertvseriesrating.user_id
    click_on "Update Togethertvseriesrating"

    assert_text "Togethertvseriesrating was successfully updated"
    click_on "Back"
  end

  test "destroying a Togethertvseriesrating" do
    visit togethertvseriesratings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Togethertvseriesrating was successfully destroyed"
  end
end
