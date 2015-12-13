require 'test_helper'

class CustomFieldTest < ActiveSupport::TestCase
  test 'Should be invalid' do
    field = CustomField.new
    assert field.invalid?
    assert field.errors.include?(:name)
    assert field.errors.include?(:field_type)
    assert field.errors.include?(:user_id)
  end

  test 'Should be unique' do
    field = CustomField.new(name: 'Type of beer', field_type: 'string', user: users(:moe))
    assert field.invalid?
    assert field.errors.include?(:name)
  end

  test 'Should be valid' do
    field = custom_fields(:moe_favorite_beer)
    assert field.valid?
  end

  test 'Should enqueue to delete' do
    field = custom_fields(:moe_favorite_beer)
    assert_difference -> { field.contact_fields.count }, -1 do
      assert field.destroy
      assert field.deleted_at.present?
    end
  end
end
