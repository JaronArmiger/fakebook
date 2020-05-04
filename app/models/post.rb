class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, foreign_key: :liked_post_id
  has_many :likers, through: :likes

  validates :content, presence: true, length: { maximum: 1000 }

end
