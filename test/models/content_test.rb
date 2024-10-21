require "test_helper"

class ContentTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @topic = topics(:one)
    @content = Content.new(
      title: "Test Content",
      content_text: "This is a test content",
      user: @user,
      topic: @topic,
      type: "Article"
    )
  end

  test "should be valid" do
    assert @content.valid?
  end

  test "title should be present" do
    @content.title = nil
    assert_not @content.valid?
  end

  test "content_text should be present" do
    @content.content_text = nil
    assert_not @content.valid?
  end

  test "user should be present" do
    @content.user = nil
    assert_not @content.valid?
  end

  test "topic should be present" do
    @content.topic = nil
    assert_not @content.valid?
  end

  test "type should be included in the valid types" do
    invalid_types = %w[Invalid Type]
    invalid_types.each do |invalid_type|
      @content.type = invalid_type
      assert_not @content.valid?
    end
  end

  test "self.types should return the correct array" do
    assert_equal %w[Article ArticleWithQuiz RequiredExercise OptionalExercise], Content.types
  end

  test "content should have many completions" do
    assert_respond_to @content, :completions
    assert_equal [], @content.completions
    @content.save!
    completion = completions(:one)
    completion.content = @content
    completion.save!
    assert_equal [ completion ], @content.completions.reload
  end

  test "content should be destroyed with its completions" do
    @content.save!
    completion = completions(:one)
    completion.content = @content
    completion.save!
    assert_difference "Completion.count", -1 do
      assert_difference "Content.count", -1 do
        @content.destroy
      end
    end
  end
end
