class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.boolean  :active, null: false, index: true

      t.timestamps
    end
  end
end
