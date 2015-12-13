class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :contact_fields, dependent: :destroy

  validates :name, :email, presence: true

  default_scope { where(deleted_at: nil) }

  def destroy
    return super if deleted_at.present?
    update_attribute(:deleted_at, Time.now)
    DeletedCleanupJob.perform_later
  end
end
