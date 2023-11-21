class CreateExchangeRates < ActiveRecord::Migration[7.1]
  def change
    create_table :exchange_rates do |t|
      t.string :base_currency
      t.string :target_currency
      t.float :rate
      t.date :date
      t.boolean  :active, null: false, index: true

      t.timestamps
    end
  end
end
