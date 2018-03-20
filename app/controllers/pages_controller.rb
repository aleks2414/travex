class PagesController < ApplicationController
  def corporativos
  	@contact = Contact.new
  end
end
