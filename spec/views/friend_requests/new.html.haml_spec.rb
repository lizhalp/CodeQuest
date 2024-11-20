require 'rails_helper'

RSpec.describe "friend_requests/new", type: :view do
  before(:each) do
    assign(:friend_request, FriendRequest.new(
      sender: nil,
      recipient: nil,
      accepted: false
    ))
  end

  it "renders new friend_request form" do
    render

    assert_select "form[action=?][method=?]", friend_requests_path, "post" do

      assert_select "input[name=?]", "friend_request[sender_id]"

      assert_select "input[name=?]", "friend_request[recipient_id]"

      assert_select "input[name=?]", "friend_request[accepted]"
    end
  end
end
