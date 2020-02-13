class AddCardStatusToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :cardStatus, :boolean, default: false
    add_column :cards, :customer_id, :integer
  end
end
