class FriendRequest < ApplicationRecord
	belongs_to :from_user, class_name: "User"
	belongs_to :to_user, class_name: "User"

	def self.cleanup(first_id, second_id)
		request_one = FriendRequest.where("from_user_id = ? AND to_user_id = ?",
							second_id, first_id)[0]
		request_one.destroy if request_one

		request_two = FriendRequest.where("from_user_id = ? AND to_user_id = ?",
							first_id, second_id)[0]
		request_two.destroy if request_two
	end
end
