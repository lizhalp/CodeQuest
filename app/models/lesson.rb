# frozen_string_literal: true

class Lesson < ApplicationRecord
  include Votable

  belongs_to :course
  belongs_to :user
  belongs_to :chapter

  has_rich_text :body
  has_many :tags, as: :taggable, dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true, limit: 3

  validates :title, presence: true, length: { maximum: 100 },
                    uniqueness: { scope: :chapter_id }
  validates :body, presence: true, length: { minimum: 500 }
end
