class CreatePhotoPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_posts do |t|
      t.string :description
      t.timestamps
    end
  end
end
