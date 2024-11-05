class MultipleChoiceQuiz < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :multiple_choice_questions, dependent: :destroy
  accepts_nested_attributes_for :multiple_choice_questions, allow_destroy: true

  validates :name, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
