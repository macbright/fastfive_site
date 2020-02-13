class ChangeForeignKeyForCards < ActiveRecord::Migration[6.0]
  def change
    remove_reference :cards, :card_type, index: true, foreign_key: true
  end
end
