class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :cardName
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
