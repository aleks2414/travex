class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Inter Travex"
    title       = "Inter Travex | México"
    description = "Las mejores experiencias al rededor de mexico en un camión"
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
