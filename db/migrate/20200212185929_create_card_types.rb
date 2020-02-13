class CreateCardTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :card_types do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
