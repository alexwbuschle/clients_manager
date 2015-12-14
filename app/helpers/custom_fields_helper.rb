module CustomFieldsHelper
  def show_value?
    @custom_field.field_type == 'select'
  end
end
