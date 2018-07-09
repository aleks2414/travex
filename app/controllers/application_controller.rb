class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

before_action :prepare_meta_tags, if: "request.get?"

before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    #This allows the attributes to be accessible at sign up. I had to add email and password after adding token. 
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :stripe_card_token, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :stripe_card_token, :password, :password_confirmation, :current_password) }
  end


  def prepare_meta_tags(options={})
    site_name   = "Inter Travex"
    title       = "Inter Travex | México"
    description = "Las mejores experiencias alrededor de México en autobús o camioneta."
    image       = options[:image] || "https://shrouded-retreat-82871.herokuapp.com/assets/logo2-737fd3d55c370e417b198c4437cd042d02e7fa2ab2d9aa3f49acdfa4f580542e.png"
    current_url = request.url
    keywords    = %w[experiencias-en-México lugares-para-visitar mejores-planes viaje-fin-de-semana viaje-de-dos-días]

    # Let's prepare a nice set of defaults
    defaults = {
      title:       title,      
      image:       image,
      revisit_after: "30 days",
      robots: "index,follow",
      distribution: "global",
      description: description,
      keywords:    keywords,
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
  # ...

end
