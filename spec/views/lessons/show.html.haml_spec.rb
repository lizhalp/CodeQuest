require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    assign(:lesson, Lesson.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
