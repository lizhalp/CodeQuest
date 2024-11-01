require "application_system_test_case"

class MultipleChoiceQuizzesTest < ApplicationSystemTestCase
  setup do
    @multiple_choice_quiz = multiple_choice_quizzes(:one)
  end

  test "visiting the index" do
    visit multiple_choice_quizzes_url
    assert_selector "h1", text: "Multiple choice quizzes"
  end

  test "should create multiple choice quiz" do
    visit multiple_choice_quizzes_url
    click_on "New multiple choice quiz"

    click_on "Create Multiple choice quiz"

    assert_text "Multiple choice quiz was successfully created"
    click_on "Back"
  end

  test "should update Multiple choice quiz" do
    visit multiple_choice_quiz_url(@multiple_choice_quiz)
    click_on "Edit this multiple choice quiz", match: :first

    click_on "Update Multiple choice quiz"

    assert_text "Multiple choice quiz was successfully updated"
    click_on "Back"
  end

  test "should destroy Multiple choice quiz" do
    visit multiple_choice_quiz_url(@multiple_choice_quiz)
    click_on "Destroy this multiple choice quiz", match: :first

    assert_text "Multiple choice quiz was successfully destroyed"
  end
end
