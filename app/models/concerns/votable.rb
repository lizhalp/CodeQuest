# frozen_string_literal: true

require "active_support/concern"

module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable, dependent: :destroy

    def vote_sum
      votes.sum(:value)
    end

    def vote_for(user)
      votes.find_by(user: user)
    end
  end
end
