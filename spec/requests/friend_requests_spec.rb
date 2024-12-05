require 'rails_helper'

RSpec.describe "/friend_requests", type: :request do
  let(:sender) { create(:user) }
  let(:recipient) { create(:user) }
  let(:valid_attributes) {
    { sender_id: sender.id, recipient_id: recipient.id }
  }

  let(:invalid_attributes) {
    { sender_id: nil, recipient_id: nil }
  }

  before do
    login_as(sender)
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new FriendRequest" do
        expect {
          post friend_requests_path, params: { friend_request: valid_attributes }
        }.to change(FriendRequest, :count).by(1)
      end

      it "redirects to the recipient" do
        post friend_requests_path, params: { friend_request: valid_attributes }
        expect(response).to redirect_to(recipient)
      end
    end

    context "with invalid parameters" do
      it "does not create a new FriendRequest" do
        expect {
          post friend_requests_path, params: { friend_request: invalid_attributes }
        }.to change(FriendRequest, :count).by(0)
      end

      it "renders a response with 422 status" do
        post friend_requests_path, params: { friend_request: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PATCH /update" do
    let(:new_attributes) {
      { sender_id: sender.id, recipient_id: recipient.id, accepted: true }
    }

    let(:friend_request) { create(:friend_request, sender_id: sender.id, recipient_id: recipient.id) }

    context "when logged in as recipient" do
      before { login_as(recipient) }

      context "with valid parameters" do
        it "updates the requested friend_request" do
          patch friend_request_path(friend_request), params: { friend_request: new_attributes }
          friend_request.reload
          expect(friend_request.accepted).to be(true)
        end

        it "redirects to the sender" do
          patch friend_request_path(friend_request), params: { friend_request: new_attributes }
          friend_request.reload
          expect(response).to redirect_to(sender)
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status" do
          patch friend_request_path(friend_request), params: { friend_request: invalid_attributes }
          expect(response).to have_http_status(422)
        end
      end
    end

    context "when logged in as sender" do
      before { login_as(sender) }

      it "does not allow sender to update the friend_request" do
        patch friend_request_path(friend_request), params: { friend_request: new_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:friend_request) { create(:friend_request, sender_id: sender.id, recipient_id: recipient.id) }

    context "when logged in as sender" do
      before { login_as(sender) }

      it "destroys the requested friend_request" do
        expect {
          delete friend_request_path(friend_request)
        }.to change(FriendRequest, :count).by(-1)
      end

      it "redirects to the recipient" do
        delete friend_request_path(friend_request)
        expect(response).to redirect_to(recipient)
      end
    end

    context "when logged in as recipient" do
      before { login_as(recipient) }

      it "does not delete the friend_request" do
        expect {
          delete friend_request_path(friend_request)
        }.to change(FriendRequest, :count).by(0)
      end
    end
  end
end
