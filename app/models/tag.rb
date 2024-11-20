# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true

  validates :name, presence: true, length: { minimum: 3, maximum: 20 },
    uniqueness: { scope: %i[taggable_id taggable_type] }
end
