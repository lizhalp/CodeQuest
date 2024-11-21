# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :set_chapter
  before_action :set_lesson, only: %i[show edit update destroy]
  allow_unauthenticated_access only: %i[show]

  # GET /lessons/1 or /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        flash[:notice] = "Lesson was successfully created."
        format.html { redirect_to @lesson.course }
        format.json { render :show, status: :created, location: @lesson }
      else
        flash[:alert] = "There was an error creating the lesson."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        flash[:notice] = "Lesson was successfully updated."
        format.html { redirect_to @lesson.course }
        format.json { render :show, status: :ok, location: @lesson }
      else
        flash[:alert] = "There was an error updating the lesson."
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy!

    respond_to do |format|
      flash[:notice] = "Lesson was successfully destroyed."
      format.html { redirect_to @lessson.course, status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(
      :title, :body, :user_id, :course_id, :chapter_id,
      tags_attributes: %i[id name _destroy]
    )
  end
end
