class CreateSubcategories < ActiveRecord::Migration[7.1]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :category_id

      t.boolean  :active, null: false, index: true
      t.timestamps
    end
  end
end
