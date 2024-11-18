# frozen_string_literal: true

require "rails_helper"

RSpec.describe "courses/show" do
  before do
    assign(:course, Course.create!(
      title: "Title",
      description: "MyText",
      user: nil,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
