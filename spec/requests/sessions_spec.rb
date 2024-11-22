require 'rails_helper'

RSpec.describe "Sessions" do
  describe "GET /new" do
    it "returns http success" do
      get new_session_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:user) { create(:user) }

    context "with valid credentials" do
      it "creates a new session" do
        expect {
          post session_path, params: { email_address: user.email_address, password: user.password }
        }.to change(Session, :count).by(1)
      end
    end

    context "with invalid credentials" do
      it "redirects to new_session_path with an alert" do
        post session_path, params: { email_address: user.email_address, password: "wrongpassword" }
        expect(response).to redirect_to(new_session_path)
        expect(flash[:alert]).to eq("Try another email address or password.")
      end
    end
  end

  describe "DELETE /destroy" do
    it "terminates the session and redirects to new_session_path" do
      login_as create(:user)
      delete session_path
      expect(response).to redirect_to(new_session_path)
    end
  end
end
