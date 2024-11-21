# frozen_string_literal: true

class Course < ApplicationRecord
  include Votable

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  validates :title, presence: true, length: { maximum: 60 }
  validates :description, presence: true, length: { maximum: 400 }

  has_many :chapters, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true, limit: 5

  has_one_attached :image
end
