# frozen_string_literal: true

class HomeController < ApplicationController
  allow_unauthenticated_access only: %i[index]

  # GET /courses or /courses.json
  def index
    @courses = Course.all.sort_by(&:vote_sum).reverse.take(7)
  end
end