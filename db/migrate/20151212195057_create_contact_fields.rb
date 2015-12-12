class CreateContactFields < ActiveRecord::Migration
  def change
    create_table :contact_fields do |t|
      t.text :value, null: false
      t.references :contact, null: false
      t.references :custom_field, null: false
      t.timestamp :deleted_at

      t.timestamps null: false
    end

    add_index :contact_fields, :id
    add_index :contact_fields, :contact_id, where: 'deleted_at is null'
  end
end
