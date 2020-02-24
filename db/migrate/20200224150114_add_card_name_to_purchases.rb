class AddCardNameToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :card_id, :integer, index: true, foreign_key: true
  end
end
