require 'test_helper'

class ContactFieldTest < ActiveSupport::TestCase
  test 'Should be invalid' do
    field = ContactField.new
    assert field.invalid?
    assert field.errors.include?(:custom_field_id)
  end

  test 'Should be valid' do
    contact_field = contact_fields(:homers_favorite_beer)
    assert contact_field.valid?
  end

  test 'Should enqueue to delete' do
    contact_field = contact_fields(:homers_favorite_beer)
    assert_difference ->  { ContactField.count }, -1 do
      assert contact_field.destroy
      assert contact_field.deleted_at.present?
    end
  end
end
