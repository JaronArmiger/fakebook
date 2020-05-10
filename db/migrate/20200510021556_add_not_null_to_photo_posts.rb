class AddNotNullToPhotoPosts < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :photo_posts, :user_id, false
  end
end
