module ApplicationHelper
	def require_log_in
	  	if !user_signed_in?
	  		puts "NOT SIGNED IN"
	  		redirect_to new_user_session_path
	  	end
    end
end
