class Chapter < ApplicationRecord
  belongs_to :course
  belongs_to :user

  has_many :lessons, dependent: :destroy

  validates :title, presence: true
  validates :number, presence: true
  validate :course_chapter_limit

  before_save :adjust_chapter_numbers, if: :number_changed?

  paginates_per 10

  private

  def course_chapter_limit
    return unless course.chapters.count >= 30

    errors.add(:course, "cannot have more than 30 chapters")
  end

  def adjust_chapter_numbers
    return unless number

    course.chapters.where("number >= ?", number).update_all("number = number + 1")
  end
end
