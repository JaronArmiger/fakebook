class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes, foreign_key: :liker_id
  has_many :liked_posts, through: :likes
  has_and_belongs_to_many :friends,
  						  class_name: "User",
  						  join_table: :friendships,
  						  foreign_key: :user_id,
  						  association_foreign_key: :friend_user_id
  has_many :friend_requests, foreign_key: :from_user_id
  has_many :received_requests, through: :friend_requests, source: :to_user
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def feed
    user_ids = friend_ids << id
    Post.where("user_id IN (#{user_ids.join(', ')})").order(created_at: :desc)
  end

  def like(post)
    self.likes.create!(liked_post_id: post.id)
  end

  def unlike(post)
    self.likes.find_by(liked_post_id: post.id).destroy
  end

  def request_sent?(to_user_id)
    if FriendRequest.where("from_user_id = ? AND to_user_id = ?",
                id, to_user_id ).empty?
      return false
    end
    true
  end
end
