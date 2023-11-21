class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string  :title, null: false
      t.text    :description
      t.date    :deadline
      t.string  :status, null: false

      t.boolean  :active, null: false, index: true
      t.integer  :created_by, null: false
      t.timestamps
    end
  end
end
