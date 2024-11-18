require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new())
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do
    end
  end
end
