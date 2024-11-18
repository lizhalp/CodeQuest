# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :user
  belongs_to :chapter

  has_rich_text :body

  validates :title, presence: true, length: { maximum: 100 },
                    uniqueness: { scope: :chapter_id }
  validates :body, presence: true, length: { minimum: 500 }
end
