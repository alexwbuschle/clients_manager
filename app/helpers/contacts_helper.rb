module ContactsHelper
  def field(custom_field: , value: '', html_options: {})
    field_name = "customs[][#{custom_field.id}]"
    case custom_field.field_type.to_sym
    when :text
      text_field_tag(field_name, value, html_options)
    when :text_area
      text_area_tag(field_name, value, html_options)
    when :select
      select_tag field_name, options_for_select(custom_field.value.split(','), value), prompt: 'Select a value'
    end
  end
end
