require "application_system_test_case"

class ContentsTest < ApplicationSystemTestCase
  setup do
    @content = contents(:one)
  end

  test "visiting the index" do
    visit contents_url
    assert_selector "h1", text: "Contents"
  end

  test "should create content" do
    visit contents_url
    click_on "New content"

    fill_in "Content text", with: @content.content_text
    fill_in "Title", with: @content.title
    fill_in "User", with: @content.user_id
    click_on "Create Content"

    assert_text "Content was successfully created"
    click_on "Back"
  end

  test "should update Content" do
    visit content_url(@content)
    click_on "Edit this content", match: :first

    fill_in "Content text", with: @content.content_text
    fill_in "Title", with: @content.title
    fill_in "User", with: @content.user_id
    click_on "Update Content"

    assert_text "Content was successfully updated"
    click_on "Back"
  end

  test "should destroy Content" do
    visit content_url(@content)
    click_on "Destroy this content", match: :first

    assert_text "Content was successfully destroyed"
  end
end
