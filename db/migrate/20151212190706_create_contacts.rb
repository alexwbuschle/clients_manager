class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.timestamp :deleted_at

      t.timestamps null: false
    end

    add_index :contacts, :id
  end
end
