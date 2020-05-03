class AddIndicesToLikes < ActiveRecord::Migration[6.0]
  def change
  	add_index :likes, :liker_id, unique: true
  	add_index :likes, :liked_post_id, unique: true
  end
end
