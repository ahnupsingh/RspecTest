require "application_system_test_case"

class NewsReleasesTest < ApplicationSystemTestCase
  setup do
    @news_release = news_releases(:one)
  end

  test "visiting the index" do
    visit news_releases_url
    assert_selector "h1", text: "News Releases"
  end

  test "creating a News release" do
    visit news_releases_url
    click_on "New News Release"

    fill_in "Body", with: @news_release.body
    fill_in "Released on", with: @news_release.released_on
    fill_in "Title", with: @news_release.title
    click_on "Create News release"

    assert_text "News release was successfully created"
    click_on "Back"
  end

  test "updating a News release" do
    visit news_releases_url
    click_on "Edit", match: :first

    fill_in "Body", with: @news_release.body
    fill_in "Released on", with: @news_release.released_on
    fill_in "Title", with: @news_release.title
    click_on "Update News release"

    assert_text "News release was successfully updated"
    click_on "Back"
  end

  test "destroying a News release" do
    visit news_releases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "News release was successfully destroyed"
  end
end
