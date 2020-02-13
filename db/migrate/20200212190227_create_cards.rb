class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :card_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :cardPin
      t.string :cardSerialNum
      t.string :cardPrice
      t.timestamps
    end
  end
end
