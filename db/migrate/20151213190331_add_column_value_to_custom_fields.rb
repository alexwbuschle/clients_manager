class AddColumnValueToCustomFields < ActiveRecord::Migration
  def change
    add_column :custom_fields, :value, :text
  end
end
