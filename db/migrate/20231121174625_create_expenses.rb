class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :description
      t.integer :amount
      t.date :date
      t.integer :category_id
      t.integer :subcategory_id

      t.boolean  :active, null: false, index: true
      t.timestamps
    end
  end
end
