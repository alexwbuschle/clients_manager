class DeletedCleanupJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Rails.logger.info 'Cleaning Contact'
    Contact.unscoped.destroy_all('deleted_at is not null')
    Rails.logger.info 'Cleaning CustomField'
    CustomField.unscoped.destroy_all('deleted_at is not null')
    Rails.logger.info 'Cleaning ContactField'
    ContactField.unscoped.destroy_all('deleted_at is not null')
  end
end
