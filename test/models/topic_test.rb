require "test_helper"

class TopicTest < ActiveSupport::TestCase
  def setup
    @topic = Topic.new(name: "Test Topic")
    @content = contents(:one)
  end

  test "should be valid" do
    assert @topic.valid?
  end

  test "name should be present" do
    @topic.name = nil
    assert_not @topic.valid?
  end
end
