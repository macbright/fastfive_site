class AddNewColumnToPurchases < ActiveRecord::Migration[6.0]
  def change
    rename_column :purchases, :cardName, :card_id
    change_column :purchases, :card_id, :integer
  end
end
