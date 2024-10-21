class Completion < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates :user, uniqueness: { scope: :content }
end
