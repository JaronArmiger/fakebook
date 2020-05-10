class User < ApplicationRecord
  has_one_attached :profile_picture

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
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook]

  validates :profile_picture, content_type: { in: %w[image/jpeg image/gif image/png],
                                              message: "must be valid image format" },
                              size: { less_than: 5.megabytes,
                                      message: "should be less than 5 MB" }

  after_create :send_sign_up_email

  def feed
    my_id = id
    id_list = friend_ids
    id_list << my_id
    Post.where("user_id IN (#{id_list.join(', ')})").order(created_at: :desc)
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

  def received_requests_count
    FriendRequest.where(to_user_id: id).count
  end

  def friend(other_user)
    self.friends << other_user
    other_user.friends << self
  end

  def display_profile_picture
    if profile_picture.attached?
      profile_picture.variant(resize_to_limit: [200,200])
    else
      "default.jpg"
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      #user.profile_picture = auth.info.image
    end
  end

  def send_sign_up_email
    UserMailer.sign_up(self).deliver_now!
  end
end



















