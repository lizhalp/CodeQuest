# frozen_string_literal: true

class HomeController < ApplicationController
  allow_unauthenticated_access only: %i[index]
  
  def index
    @instance_variable = nil
  end
end