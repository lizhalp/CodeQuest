require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(),
      Lesson.create!()
    ])
  end

  it "renders a list of lessons" do
    render
    cell_selector = 'div>p'
  end
end
