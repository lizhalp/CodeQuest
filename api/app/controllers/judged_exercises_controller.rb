class JudgedExercisesController < ApplicationController
  before_action :set_judged_exercise, only: %i[ show update destroy ]

  # GET /judged_exercises
  def index
    @judged_exercises = JudgedExercise.all

    render json: @judged_exercises
  end

  # GET /judged_exercises/1
  def show
    render json: @judged_exercise
  end

  # POST /judged_exercises
  def create
    @judged_exercise = JudgedExercise.new(judged_exercise_params)

    if @judged_exercise.save
      render json: @judged_exercise, status: :created, location: @judged_exercise
    else
      render json: @judged_exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /judged_exercises/1
  def update
    if @judged_exercise.update(judged_exercise_params)
      render json: @judged_exercise
    else
      render json: @judged_exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /judged_exercises/1
  def destroy
    @judged_exercise.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_judged_exercise
      @judged_exercise = JudgedExercise.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def judged_exercise_params
      params.expect(judged_exercise: [ :language_id, :solution, :test_cases ])
    end
end
