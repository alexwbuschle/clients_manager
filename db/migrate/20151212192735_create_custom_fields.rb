class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :name, null: false
      t.string :field_type, null: false
      t.datetime :deleted_at
      t.references :user, null: false

      t.timestamps null: false
    end

    add_index :custom_fields, [:id, :user_id], where: 'deleted_at is null'
  end
end
