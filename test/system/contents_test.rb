require "application_system_test_case"

class ContentSystemTest < ApplicationSystemTestCase
  setup do
    # @content = contents(:one) # Assuming you have a fixture named 'one' for contents
    # @user = users(:one) # Assuming you have a fixture named 'one' for users
  end

  test "voting on content" do
    # visit content_path(@content)

    # # Check initial state
    # assert_selector ".vote-sum", text: "0"

    # # Simulate a user voting
    # find('.vote-button[data-value="1"]').click

    # # Wait for the AJAX request to complete and the page to reload
    # sleep 1

    # # Check that the vote sum has increased
    # assert_selector ".vote-sum", text: "1"
  end

  test "viewing content" do
    # visit content_path(@content)

    # # Check that the content title and user are displayed
    # assert_selector ".card-title", text: @content.title
    # assert_selector ".card-subtitle", text: "By: #{@content.user.username}"

    # # Check that the content text is displayed
    # assert_selector ".card-text", text: @content.content_text
  end

  test "marking content as completed" do
    # visit content_path(@content)

    # # Check if the "Mark completed" button is visible
    # assert_selector ".btn-primary", text: "Mark completed"

    # # Simulate marking the content as completed
    # click_on "Mark completed"

    # # Wait for the page to reload
    # sleep 1

    # # Check that the "Mark completed" button is no longer visible
    # assert_no_selector ".btn-primary", text: "Mark completed"

    # # Check that the "Back to Topics" link is visible
    # assert_selector ".btn-secondary", text: "Back to Topics"
  end
end
