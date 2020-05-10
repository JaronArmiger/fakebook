class AddUserRefToPhotoPosts < ActiveRecord::Migration[6.0]
  def change
  	add_reference :photo_posts, :user, index: true
  end
end
