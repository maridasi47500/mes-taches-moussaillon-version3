require "application_system_test_case"

class CreateWebpagesTest < ApplicationSystemTestCase
  setup do
    @create_webpage = create_webpages(:one)
  end

  test "visiting the index" do
    visit create_webpages_url
    assert_selector "h1", text: "Create Webpages"
  end

  test "creating a Create webpage" do
    visit create_webpages_url
    click_on "New Create Webpage"

    fill_in "Title", with: @create_webpage.title
    fill_in "Url", with: @create_webpage.url
    click_on "Create Create webpage"

    assert_text "Create webpage was successfully created"
    click_on "Back"
  end

  test "updating a Create webpage" do
    visit create_webpages_url
    click_on "Edit", match: :first

    fill_in "Title", with: @create_webpage.title
    fill_in "Url", with: @create_webpage.url
    click_on "Update Create webpage"

    assert_text "Create webpage was successfully updated"
    click_on "Back"
  end

  test "destroying a Create webpage" do
    visit create_webpages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Create webpage was successfully destroyed"
  end
end
