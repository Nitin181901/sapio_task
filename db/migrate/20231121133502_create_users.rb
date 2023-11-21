class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :role_id, default: 1

      t.boolean :active
      t.integer :created_by
      t.timestamps
    end
  end
end
