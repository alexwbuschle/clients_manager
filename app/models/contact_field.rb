class ContactField < ActiveRecord::Base
  validates :contact_id, :custom_field_id, :value, presence: true
  validates :custom_field_id, uniqueness: { scope: :contact_id }
end
