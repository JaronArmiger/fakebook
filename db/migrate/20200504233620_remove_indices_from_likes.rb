class RemoveIndicesFromLikes < ActiveRecord::Migration[6.0]
  def change
  	remove_index :likes, :liker_id
  	remove_index :likes, :liked_post_id
  	# add indices back without unique constraint
  	add_index :likes, :liker_id
  	add_index :likes, :liked_post_id
  end
end
