class CustomField < ActiveRecord::Base
  belongs_to :user

  validates :name, :field_type, :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
