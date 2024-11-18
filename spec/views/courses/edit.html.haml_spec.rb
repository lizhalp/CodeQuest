# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/edit" do
  let(:course) {
    Course.create!(
      title: "MyString",
      description: "MyText",
      user: nil,
    )
  }

  before do
    assign(:course, course)
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(course), "post" do
      assert_select "input[name=?]", "course[title]"

      assert_select "textarea[name=?]", "course[description]"

      assert_select "input[name=?]", "course[user_id]"
    end
  end
end
