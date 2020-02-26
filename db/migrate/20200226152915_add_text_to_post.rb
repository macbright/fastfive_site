class AddTextToPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :body
  end
end
