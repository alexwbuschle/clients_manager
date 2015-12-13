require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'Should be invalid' do
    contact = Contact.new
    refute contact.valid?
    assert contact.errors.include?(:name)
    assert contact.errors.include?(:email)
  end

  test 'Should be valid' do
    contact = contacts(:homer_moes_contact)
    assert contact.valid?
  end

  test 'Should enqueue to delete' do
    contact = contacts(:homer_moes_contact)
    assert_difference ->  { contact.contact_fields.count }, -1 do
      assert contact.destroy
      assert contact.deleted_at.present?
    end
  end
end
