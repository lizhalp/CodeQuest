require 'rails_helper'

RSpec.describe "friend_requests/show", type: :view do
  before(:each) do
    assign(:friend_request, FriendRequest.create!(
      sender: nil,
      recipient: nil,
      accepted: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
