# frozen_string_literal: true

#  create_table "votes", force: :cascade do |t|
# t.integer "user_id"
# t.integer "content_id"
# t.integer "value"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# end
class Vote < ApplicationRecord
  validates :user_id, presence: true,
    uniqueness: { scope: :content_id, message: "has already voted for this content" }
  validates :content_id, presence: true
  validates :value, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: -1, less_than_or_equal_to: 1
  }
end
