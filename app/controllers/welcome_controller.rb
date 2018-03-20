class WelcomeController < ApplicationController
  def index
  	@experiences = Experience.where(:disponible => true).limit(3)
  	@q= Experience.where(:disponible => true).ransack(params[:q])
    @experiences = @q.result.uniq
  end
end
