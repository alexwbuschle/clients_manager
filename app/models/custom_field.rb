class CustomField < ActiveRecord::Base
  belongs_to :user
  has_many :contact_fields, dependent: :destroy

  validates :name, :field_type, :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :field_type, inclusion: { in: %w(text text_area select) }

  default_scope { where(deleted_at: nil) }

  def destroy
    return super if deleted_at.present?
    update_attribute(:deleted_at, Time.now)
    DeletedCleanupJob.perform_later
  end
end
