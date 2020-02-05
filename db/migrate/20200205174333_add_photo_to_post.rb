class AddPhotoToPost < ActiveRecord::Migration[6.0]
  def up
    add_attachment :posts, :photo
  end

  def down
    remove_attachment :posts, :photo
  end
end
