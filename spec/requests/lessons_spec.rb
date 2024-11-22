# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/lessons" do
  let(:course) { create(:course) }
  let(:chapter) { course.chapters.to_a.sample }
  let(:user) { create(:user) }

  describe "GET /show" do
    let(:lesson) { create(:lesson, chapter:) }
    subject(:request) { get chapter_lesson_url(chapter, lesson) }

    it "renders a successful response" do
      request
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    subject(:request) { get new_chapter_lesson_url(chapter) }

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
    let(:lesson) { create(:lesson, chapter:) }
    subject(:request) { get edit_chapter_lesson_url(chapter, lesson) }

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

  describe "POST /create" do
    context "when user is logged in" do
      before { login_as(user) }

      context "with valid parameters" do
        let(:lesson_params) { attributes_for(:lesson, course_id: chapter.course.id, chapter_id: chapter.id) }
        subject(:request) { post chapter_lessons_url(chapter), params: { lesson: lesson_params } }

        it "creates a new Lesson" do
          expect { request }.to change(Lesson, :count).by(1)
        end

        it "redirects to the created lesson's course" do
          request
          expect(response).to redirect_to(course)
        end
      end

      context "with invalid parameters" do
        let(:lesson_params) { attributes_for(:lesson, title: nil, chapter_id: chapter.id) }
        subject(:request) { post chapter_lessons_url(chapter), params: { lesson: lesson_params } }

        it "does not create a new Lesson" do
          expect { request }.not_to change(Lesson, :count)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          request
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "when user is not logged in" do
      let(:lesson_params) { attributes_for(:lesson, chapter_id: chapter.id) }
      subject(:request) { post chapter_lessons_url(chapter), params: { lesson: lesson_params } }

      it "redirects to the login page" do
        request
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "PATCH /update" do
    let(:lesson) { create(:lesson, chapter:) }

    context "when user is logged in" do
      before { login_as(user) }

      context "with valid parameters" do
        let(:lesson_params) { attributes_for(:lesson, course_id: chapter.course.id, title: "New Title") }
        subject(:request) { patch chapter_lesson_url(chapter, lesson), params: { lesson: lesson_params } }

        it "updates the requested lesson" do
          request
          lesson.reload
          expect(lesson.title).to eq("New Title")
        end

        it "redirects to the lesson's course" do
          request
          expect(response).to redirect_to(chapter.course)
        end
      end

      context "with invalid parameters" do
        let(:lesson_params) { attributes_for(:lesson, title: nil) }
        subject(:request) { patch chapter_lesson_url(chapter, lesson), params: { lesson: lesson_params } }

        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          request
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "when user is not logged in" do
      let(:lesson_params) { attributes_for(:lesson, title: "New Title") }
      subject(:request) { patch chapter_lesson_url(chapter, lesson), params: { lesson: lesson_params } }

      it "redirects to the login page" do
        request
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:lesson) { create(:lesson, chapter:) }

    context "when user is logged in" do
      before { login_as(user) }
      subject(:request) { delete chapter_lesson_url(chapter, lesson) }

      it "destroys the requested lesson" do
        expect { request }.to change(Lesson, :count).by(-1)
      end

      it "redirects to the lesson's course" do
        request
        expect(response).to redirect_to(course)
      end
    end

    context "when user is not logged in" do
      subject(:request) { delete chapter_lesson_url(chapter, lesson) }

      it "redirects to the login page" do
        request
        expect(response).to redirect_to(new_session_url)
      end
    end
  end
end
