require 'test_helper'

class DeletedCleanupJobTest < ActiveJob::TestCase
  test 'Should delete the register after fill the deleted_at' do
    field = custom_fields(:moe_favorite_beer)
    assert field.destroy
    assert field.deleted_at.present?
    assert_raise ActiveRecord::RecordNotFound do
      CustomField.find(field.id)
    end
  end
end
