require "application_system_test_case"

class ScorecriteriaTest < ApplicationSystemTestCase
  setup do
    @scorecriterium = scorecriteria(:one)
  end

  test "visiting the index" do
    visit scorecriteria_url
    assert_selector "h1", text: "Scorecriteria"
  end

  test "creating a Scorecriterium" do
    visit scorecriteria_url
    click_on "New Scorecriterium"

    fill_in "Description", with: @scorecriterium.description
    fill_in "Gooduser", with: @scorecriterium.gooduser_id
    fill_in "Musicalscore", with: @scorecriterium.musicalscore_id
    click_on "Create Scorecriterium"

    assert_text "Scorecriterium was successfully created"
    click_on "Back"
  end

  test "updating a Scorecriterium" do
    visit scorecriteria_url
    click_on "Edit", match: :first

    fill_in "Description", with: @scorecriterium.description
    fill_in "Gooduser", with: @scorecriterium.gooduser_id
    fill_in "Musicalscore", with: @scorecriterium.musicalscore_id
    click_on "Update Scorecriterium"

    assert_text "Scorecriterium was successfully updated"
    click_on "Back"
  end

  test "destroying a Scorecriterium" do
    visit scorecriteria_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scorecriterium was successfully destroyed"
  end
end
