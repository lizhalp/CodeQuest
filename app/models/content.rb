class Content < ApplicationRecord
  has_rich_text :content_text

  Content.inheritance_column = nil

  belongs_to :user
  belongs_to :topic

  has_many :completions, dependent: :destroy

  validates :title, presence: true
  validates :content_text, presence: true
  validates :user, presence: true
  validates :topic, presence: true
  validates :type, inclusion: { in: %w[ Article ArticleWithQuiz RequiredExercise OptionalExercise ] }

  def self.types
    %w[ Article ArticleWithQuiz RequiredExercise OptionalExercise ]
  end
end
