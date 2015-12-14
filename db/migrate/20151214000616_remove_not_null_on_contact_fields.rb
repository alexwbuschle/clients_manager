class RemoveNotNullOnContactFields < ActiveRecord::Migration
  def change
    change_column_null :contact_fields, :value, true
  end
end
