class WelcomeController < ApplicationController
  def index
  	@experiences = Experience.all.limit(3)
  end
end
