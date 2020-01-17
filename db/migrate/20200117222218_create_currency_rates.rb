class CreateCurrencyRates < ActiveRecord::Migration[6.0]
  def change
    create_table :currency_rates do |t|
      t.integer :code, null: false, default: 0
      t.integer :name, null: false, default: 0
      t.float :buy, null: false, default: 0.0
      t.float :sell, null: false, default: 0.0

      t.timestamps
    end
  end
end
