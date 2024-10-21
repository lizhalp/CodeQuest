require "test_helper"

class CompletionTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @content = contents(:one)
    @completion = Completion.new(user: @user, content: @content)
  end

  test "should require a user" do
    @completion.user = nil
    assert_not @completion.valid?
  end

  test "should require content" do
    @completion.content = nil
    assert_not @completion.valid?
  end

  test "should be unique for a given user and content" do
    duplicate_completion = @completion.dup
    @completion.save
    assert_not duplicate_completion.valid?
  end
end
