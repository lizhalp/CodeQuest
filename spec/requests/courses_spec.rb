# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/courses" do
  describe "GET /index" do
    subject(:request) { get courses_url }

    it "renders a successful response" do
      request
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:course) { create(:course) }
    subject(:request) { get course_url(course) }

    it "renders a successful response" do
      request
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    let(:user) { create(:user) }
    subject(:request) { get new_course_url }

    context "when user is logged in" do
      before { login_as(user) }

      it "renders a successful response" do
        request
        expect(response).to be_successful
      end
    end

    context "when user is not logged in" do
      it "redirects to the login page" do
        request
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "GET /edit" do
    let(:owner) { create(:user) }
    let(:visitor) { create(:user) }
    let(:course) { create(:course, user: owner) }
    subject(:request) { get edit_course_url(course) }

    context "when user is logged in and course owner" do
      before { login_as(owner) }

      it "renders a successful response" do
        request
        expect(response).to be_successful
      end
    end

    context "when user is logged in and not course owner" do
      before { login_as(visitor) }

      it "renders a succesful response" do
        request
        expect(response).to be_successful
      end
    end

    context "when user is not logged in" do
      it "redirects to the login page" do
        request
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "POST /create" do
    let(:user) { create(:user) }

    context "when user is logged in" do
      before { login_as(user) }

      context "with valid parameters" do
        let(:course_params) { attributes_for(:course) }
        subject(:request) { post courses_url, params: { course: course_params } }

        it "creates a new Course" do
          expect { request }.to change(Course, :count).by(1)
        end

        it "redirects to the created course" do
          request
          expect(response).to redirect_to(Course.last)
        end
      end

      context "with invalid parameters" do
        let(:course_params) { attributes_for(:course).merge(title: nil) }
        subject(:request) { post courses_url, params: { course: course_params } }

        it "does not create a new Course" do
          expect { request }.not_to change(Course, :count)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          request
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "when user is not logged in" do
      let(:course_params) { attributes_for(:course) }
      subject(:request) { post courses_url, params: { course: course_params } }

      it "redirects to the login page" do
        request
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "PATCH /update" do
    let(:user) { create(:user) }
    let(:course) { create(:course, user:) }

    context "when user is logged in and course owner" do
      before { login_as(user) }

      context "with valid parameters" do
        let(:course_params) { attributes_for(:course).merge(title: "New Title") }
        subject(:request) { patch course_url(course), params: { course: course_params } }

        it "updates the requested course" do
          request
          course.reload
          expect(course.title).to eq("New Title")
        end

        it "redirects to the course" do
          request
          expect(response).to redirect_to(course)
        end
      end

      context "with invalid parameters" do
        let(:course_params) { attributes_for(:course).merge(title: nil) }
        subject(:request) { patch course_url(course), params: { course: course_params } }

        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          request
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "when user is not logged in" do
      let(:course_params) { attributes_for(:course).merge(title: "New Title") }
      subject(:request) { patch course_url(course), params: { course: course_params } }

      it "redirects to the login page" do
        request
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "DELETE /destroy" do
    let(:user) { create(:user) }
    let!(:course) { create(:course, user:) }

    context "when user is logged in" do
      before { login_as(user) }
      subject(:request) { delete course_url(course) }

      it "destroys the requested course" do
        expect { request }.to change(Course, :count).by(-1)
      end

      it "redirects to the courses list" do
        request
        expect(response).to redirect_to(courses_url)
      end
    end

    context "when user is not logged in" do
      subject(:request) { delete course_url(course) }

      it "redirects to the login page" do
        request
        expect(response).to redirect_to(new_session_url)
      end
    end
  end
end
