require 'test_helper'

class CustomFieldTest < ActiveSupport::TestCase
  test 'Should be invalid' do
    field = CustomField.new
    refute field.invalid?
    assert field.errors.include?(:name)
    assert field.errors.include?(:field_type)
    assert field.errors.include?(:user_id)
  end

  test 'Should be unique' do
    CustomField.create(name: 'favorite_colour', field_type: 'string', user: users(:homer))
    field = CustomField.new(name: 'favorite_colour', field_type: 'string', user: users(:homer))
    assert field.invalid?
    assert field.errors.include?(:name)
  end
end
