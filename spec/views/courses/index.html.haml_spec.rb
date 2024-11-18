# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/index" do
  before do
    assign(:courses, [
             Course.create!(
               title: "Title",
               description: "MyText",
               user: nil,
             ),
             Course.create!(
               title: "Title",
               description: "MyText",
               user: nil,
             ),
           ])
  end

  it "renders a list of courses" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
