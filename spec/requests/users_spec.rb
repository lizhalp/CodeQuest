# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users" do
  describe "GET /new" do
    it "returns http success" do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let(:user) { create(:user) }
    before { login_as user }

    it "returns http success" do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) { attributes_for(:user) }

    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_path, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_path, params: { user: { email_address: "invalid" } }
        }.to change(User, :count).by(0)
      end

      it "responds with unprocessable entity" do
        post users_path, params: { user: { email_address: "invalid" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:user) { create(:user) }

    it "destroys the requested user" do
      expect {
        delete user_path(user)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the new user path" do
      delete user_path(user)
      expect(response).to redirect_to(new_user_path)
    end
  end
end
