class Topic < ApplicationRecord
  has_many :contents, dependent: :destroy
  has_many :multiple_choice_quizzes, dependent: :destroy

  validates :name, presence: true

  def articles
    contents.where(type: "Article")
  end

  def required_exercises
    contents.where(type: "RequiredExercise")
  end

  def optional_exercises
    contents.where(type: "OptionalExercise")
  end

  def completed_content(user)
    user.completions.where(content: contents).map(&:content)
  end

  def incomplete_content(user)
    contents - completed_content(user)
  end
end
