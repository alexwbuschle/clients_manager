class CustomFieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_custom_field, only: [:show, :edit, :update, :destroy]

  def index
    @custom_fields = current_user.custom_fields
  end

  def new
    @custom_field = CustomField.new
  end

  def edit
  end

  def create
    @custom_field = CustomField.new(custom_field_params)
    @custom_field.user = current_user

    if @custom_field.save
      redirect_to custom_fields_path, notice: 'Field was successfully created.'
    else
      render :new
    end
  end

  def update
    if @custom_field.update(custom_field_params)
      redirect_to custom_fields_path, notice: 'Field was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @custom_field.destroy
    respond_to do |format|
      format.html { redirect_to custom_fields_url, notice: 'Field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_custom_field
    @custom_field = current_user.custom_fields.find(params[:id])
  end

  def custom_field_params
    params.require(:custom_field).permit(:name, :field_type, :value)
  end
end
