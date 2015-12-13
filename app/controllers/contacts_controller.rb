class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    assemble_customs

    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      assemble_customs
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_contact
    @contact = current_user.contacts.where(id: params[:id]).includes(:contact_fields).first
  end

  def contact_params
    params.require(:contact).permit(:name, :email)
  end

  def assemble_customs
    params[:customs].first.each_pair do |id, value|
      field = @contact.contact_fields.detect { |cf| cf.custom_field_id == id } || @contact.contact_fields.build(custom_field_id: id)
      next if value.blank? && field.new_record?
      field.value = value
      field.save if field.persisted?
    end
  end
end
