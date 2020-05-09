class UserMailer < ApplicationMailer
	def sign_up(user)
		@user = user
		mail to: user.email, subject: "merci pour s'inscrire"
	end
end
