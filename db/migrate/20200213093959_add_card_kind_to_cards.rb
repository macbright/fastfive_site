class AddCardKindToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :cardKind, :integer
    add_column :cards, :name, :string
  end
end
