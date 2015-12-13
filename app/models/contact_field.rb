class ContactField < ActiveRecord::Base
  belongs_to :custom_field
  belongs_to :contact

  validates :custom_field_id, presence: true, uniqueness: { scope: :contact_id }

  default_scope { where(deleted_at: nil) }

  def destroy
    return super if deleted_at.present?
    update_attribute(:deleted_at, Time.now)
    DeletedCleanupJob.perform_later
  end
end
