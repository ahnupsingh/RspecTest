require 'test_helper'

class NewsReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_release = news_releases(:one)
  end

  test "should get index" do
    get news_releases_url
    assert_response :success
  end

  test "should get new" do
    get new_news_release_url
    assert_response :success
  end

  test "should create news_release" do
    assert_difference('NewsRelease.count') do
      post news_releases_url, params: { news_release: { body: @news_release.body, released_on: @news_release.released_on, title: @news_release.title } }
    end

    assert_redirected_to news_release_url(NewsRelease.last)
  end

  test "should show news_release" do
    get news_release_url(@news_release)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_release_url(@news_release)
    assert_response :success
  end

  test "should update news_release" do
    patch news_release_url(@news_release), params: { news_release: { body: @news_release.body, released_on: @news_release.released_on, title: @news_release.title } }
    assert_redirected_to news_release_url(@news_release)
  end

  test "should destroy news_release" do
    assert_difference('NewsRelease.count', -1) do
      delete news_release_url(@news_release)
    end

    assert_redirected_to news_releases_url
  end
end
