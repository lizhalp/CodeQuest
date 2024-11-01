require "test_helper"

class MultipleChoiceQuizzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multiple_choice_quiz = multiple_choice_quizzes(:one)
  end

  test "should get index" do
    get multiple_choice_quizzes_url
    assert_response :success
  end

  test "should get new" do
    get new_multiple_choice_quiz_url
    assert_response :success
  end

  test "should create multiple_choice_quiz" do
    assert_difference("MultipleChoiceQuiz.count") do
      post multiple_choice_quizzes_url, params: { multiple_choice_quiz: {} }
    end

    assert_redirected_to multiple_choice_quiz_url(MultipleChoiceQuiz.last)
  end

  test "should show multiple_choice_quiz" do
    get multiple_choice_quiz_url(@multiple_choice_quiz)
    assert_response :success
  end

  test "should get edit" do
    get edit_multiple_choice_quiz_url(@multiple_choice_quiz)
    assert_response :success
  end

  test "should update multiple_choice_quiz" do
    patch multiple_choice_quiz_url(@multiple_choice_quiz), params: { multiple_choice_quiz: {} }
    assert_redirected_to multiple_choice_quiz_url(@multiple_choice_quiz)
  end

  test "should destroy multiple_choice_quiz" do
    assert_difference("MultipleChoiceQuiz.count", -1) do
      delete multiple_choice_quiz_url(@multiple_choice_quiz)
    end

    assert_redirected_to multiple_choice_quizzes_url
  end
end
