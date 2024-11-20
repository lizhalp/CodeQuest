# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/new" do
  before do
    assign(:course, Course.new(
      title: "MyString",
      description: "MyText",
      user: nil,
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do
      assert_select "input[name=?]", "course[title]"

      assert_select "textarea[name=?]", "course[description]"

      assert_select "input[name=?]", "course[user_id]"
    end
  end
end
