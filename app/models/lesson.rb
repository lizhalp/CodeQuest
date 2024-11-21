# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :user
  belongs_to :chapter

  has_rich_text :body
  has_many :tags, as: :taggable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true, limit: 3

  validates :title, presence: true, length: { maximum: 100 },
                    uniqueness: { scope: :chapter_id }
  validates :body, presence: true, length: { minimum: 500 }
end
