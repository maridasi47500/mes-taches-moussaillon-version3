require "application_system_test_case"

class WorktwosTest < ApplicationSystemTestCase
  setup do
    @worktwo = worktwos(:one)
  end

  test "visiting the index" do
    visit worktwos_url
    assert_selector "h1", text: "Worktwos"
  end

  test "creating a Worktwo" do
    visit worktwos_url
    click_on "New Worktwo"

    fill_in "Link", with: @worktwo.link
    fill_in "Otherperson", with: @worktwo.otherperson_id
    fill_in "Person", with: @worktwo.person_id
    click_on "Create Worktwo"

    assert_text "Worktwo was successfully created"
    click_on "Back"
  end

  test "updating a Worktwo" do
    visit worktwos_url
    click_on "Edit", match: :first

    fill_in "Link", with: @worktwo.link
    fill_in "Otherperson", with: @worktwo.otherperson_id
    fill_in "Person", with: @worktwo.person_id
    click_on "Update Worktwo"

    assert_text "Worktwo was successfully updated"
    click_on "Back"
  end

  test "destroying a Worktwo" do
    visit worktwos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Worktwo was successfully destroyed"
  end
end
