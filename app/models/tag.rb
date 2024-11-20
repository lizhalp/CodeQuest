# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true

  validates :name, presence: true, uniqueness: { scope: %i[taggable_id taggable_type] }
end
