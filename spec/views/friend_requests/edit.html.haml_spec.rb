require 'rails_helper'

RSpec.describe "friend_requests/edit", type: :view do
  let(:friend_request) {
    FriendRequest.create!(
      sender: nil,
      recipient: nil,
      accepted: false
    )
  }

  before(:each) do
    assign(:friend_request, friend_request)
  end

  it "renders the edit friend_request form" do
    render

    assert_select "form[action=?][method=?]", friend_request_path(friend_request), "post" do

      assert_select "input[name=?]", "friend_request[sender_id]"

      assert_select "input[name=?]", "friend_request[recipient_id]"

      assert_select "input[name=?]", "friend_request[accepted]"
    end
  end
end
