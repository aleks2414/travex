class ContactsController < ApplicationController
  def new
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

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Mensaje envíado. Gracias'
    else
      flash.now[:error] = 'Lo lamentamos, no se puede enviar el mensaje'
      render :new
    end
  end
end
