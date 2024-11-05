class MultipleChoiceQuizAttempt < ApplicationRecord
  belongs_to :user
  belongs_to :multiple_choice_quiz
end
