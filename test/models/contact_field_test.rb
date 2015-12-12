require 'test_helper'

class ContactFieldTest < ActiveSupport::TestCase
  test 'Should be invalid' do
    field = ContactField.new
    assert field.invalid?
    assert field.errors.include?(:contact_id)
    assert field.errors.include?(:custom_field_id)
    assert field.errors.include?(:value)
  end
end
