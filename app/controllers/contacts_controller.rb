class ContactsController < ApplicationController
  def new
  end


  #skip_before_action :verify_authenticity_token если форму вручную писать

  def create
    #render plain: params[:contact].inspect выводит хэш
    @contact = Contact.new(contact_params)
    
    if @contact.valid?
      @contact.save
    else
      render action: 'new'
    end

  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end
