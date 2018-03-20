class WelcomeController < ApplicationController
  def index
  	@experiences = Experience.all.limit(3)
  	@q= Experience.ransack(params[:q])
    @experiences = @q.result.uniq
  end
end
