class PagesController < ApplicationController
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
end
