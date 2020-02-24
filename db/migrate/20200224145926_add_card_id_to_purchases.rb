class AddCardIdToPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :card_id
  end
end
