# frozen_string_literal: true

class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i[update destroy edit]

  def edit
  end

  def create
    @chapter = Chapter.create!(chapter_params)
    redirect_to @chapter.course
  end

  def update
    @chapter.update!(chapter_params[:chapter])
    redirect_to @course
  end

  def destroy
    @chapter.destroy!
    redirect_to @course
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.expect(chapter: [ :title, :user_id, :course_id, :number ])
  end
end
