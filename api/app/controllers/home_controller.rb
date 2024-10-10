class HomeController < ApplicationController
  def index
    @routes = []

    Rails.application.routes.routes.each do |route|
      @routes << {
        name: route.name,
        verb: route.verb,
      }      
    end
  end

  render :json => @routes
end
