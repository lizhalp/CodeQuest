class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true
end
