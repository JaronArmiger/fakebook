class UserMailer < ApplicationMailer
	def sign_up_email(user)
		@user = user
		mail to: user.email, subject: "merci pour s'inscrire"
	end
end
