class MultipleChoiceQuizzesController < ApplicationController
  before_action :set_multiple_choice_quiz, only: %i[ show edit update destroy submit ]
  before_action :set_topic, only: %i[ new create show edit update destroy submit]

  # GET /multiple_choice_quizzes or /multiple_choice_quizzes.json
  def index
    @multiple_choice_quizzes = MultipleChoiceQuiz.all
  end

  # GET /multiple_choice_quizzes/1 or /multiple_choice_quizzes/1.json
  def show
  end

  # GET /multiple_choice_quizzes/new
  def new
    @multiple_choice_quiz = MultipleChoiceQuiz.new
    @multiple_choice_quiz.multiple_choice_questions.build
  end

  # GET /multiple_choice_quizzes/1/edit
  def edit
  end

  # POST /multiple_choice_quizzes or /multiple_choice_quizzes.json
  def create
    @multiple_choice_quiz = MultipleChoiceQuiz.new(multiple_choice_quiz_params)

    respond_to do |format|
      if @multiple_choice_quiz.save
        flash[:success] = "Multiple choice quiz was successfully created."
        format.html { redirect_to @multiple_choice_quiz }
        format.json { render :show, status: :created, location: @multiple_choice_quiz }
      else
        format.html { render :new, status: :unprocessable_entity, flash: { error: @multiple_choice_quiz.errors.full_messages.join(", ") } }
        format.json { render json: @multiple_choice_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multiple_choice_quizzes/1 or /multiple_choice_quizzes/1.json
  def update
    respond_to do |format|
      if @multiple_choice_quiz.update(multiple_choice_quiz_params)
        flash[:success] = "Multiple choice quiz was successfully updated."
        format.html { redirect_to @topic }
        format.json { render :show, status: :ok, location: @multiple_choice_quiz }
      else
        format.html { render :edit, status: :unprocessable_entity, flash: { error: @multiple_choice_quiz.errors.full_messages.join(", ") } }
        format.json { render json: @multiple_choice_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multiple_choice_quizzes/1 or /multiple_choice_quizzes/1.json
  def destroy
    @multiple_choice_quiz.destroy!

    respond_to do |format|
      format.html { redirect_to multiple_choice_quizzes_path, status: :see_other, flash: { success: "Multiple choice quiz was successfully destroyed." } }
      format.json { head :no_content }
    end
  end

  def submit
    @score = 0
    @multiple_choice_quiz.multiple_choice_questions.each do |question|
      @score += 1 if question.answer == params["question_#{question.id}"]
    end
    flash[:success] = "You scored #{@score} out of #{@multiple_choice_quiz.multiple_choice_questions.count}"
    redirect_to @topic
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiple_choice_quiz
      @multiple_choice_quiz = MultipleChoiceQuiz.find(params[:id])
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    # Only allow a list of trusted parameters through.
    def multiple_choice_quiz_params
      params.require(:multiple_choice_quiz).permit(:name, multiple_choice_questions_attributes: [ :id, :text, :options, :answer, :_destroy ])
    end
end
