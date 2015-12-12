require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'Should be an invalid contact' do
    contact = Contact.new
    refute contact.valid?
    assert contact.errors.include?(:name)
    assert contact.errors.include?(:email)
  end
end
