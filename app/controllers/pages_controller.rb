class PagesController < ApplicationController
before_action :filter_admin!, only: [:mis_experiencias]
  def corporativos
  	@contact = Contact.new

prepare_meta_tags(title: "",
  description: "", 
  keywords: %w[Innovación en México, diferenciación],
      og: {
        site_name: "Inter Travex",
        title: "",
        description: "",
        type: 'website'
      }
)
  end

  def mis_experiencias
    @experiences = Experience.all
  end

  private
    def filter_admin!
     authenticate_user!
     redirect_to root_path, alert: "No tienes acceso" unless current_user.admin?
   end
end
