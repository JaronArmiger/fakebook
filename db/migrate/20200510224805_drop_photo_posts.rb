class DropPhotoPosts < ActiveRecord::Migration[6.0]
  def change
  	drop_table :photo_posts
  end
end
