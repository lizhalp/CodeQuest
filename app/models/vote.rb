class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user_id, uniqueness: { scope: %i[votable_id votable_type] }
  validates :value, inclusion: { in: [ -1, 1 ] }
end
