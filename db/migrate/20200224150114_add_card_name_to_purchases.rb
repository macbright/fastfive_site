class AddCardNameToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :card_id, :integer,  foreign_key: true
  end
end
