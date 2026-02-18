require "application_system_test_case"

class PersongraduatedschoolsTest < ApplicationSystemTestCase
  setup do
    @persongraduatedschool = persongraduatedschools(:one)
  end

  test "visiting the index" do
    visit persongraduatedschools_url
    assert_selector "h1", text: "Persongraduatedschools"
  end

  test "creating a Persongraduatedschool" do
    visit persongraduatedschools_url
    click_on "New Persongraduatedschool"

    click_on "Create Persongraduatedschool"

    assert_text "Persongraduatedschool was successfully created"
    click_on "Back"
  end

  test "updating a Persongraduatedschool" do
    visit persongraduatedschools_url
    click_on "Edit", match: :first

    click_on "Update Persongraduatedschool"

    assert_text "Persongraduatedschool was successfully updated"
    click_on "Back"
  end

  test "destroying a Persongraduatedschool" do
    visit persongraduatedschools_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Persongraduatedschool was successfully destroyed"
  end
end
