class Frontend::ContactController < Frontend::ApplicationController
  def new
    @contact = Contact.new
  end

  def send_contact
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      DefaultMailer.contact(@contact).deliver
      redirect_to contact_path, :notice => 'Contato enviado com sucesso.'
    else
      render :new
    end
  end
end
