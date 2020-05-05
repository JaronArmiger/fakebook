class CommentsController < ApplicationController
	before_action :correct_user, only: [:destroy]

	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save
			redirect_to params[:current_url]
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@comment.destroy
		flash[:success] = "commentaire effacer"
		redirect_to request.referrer || root_url
	end

	private

		def comment_params
			params.require(:comment).permit(:content, :post_id)
		end

		def correct_user
			@comment = current_user.comments.find_by(id: params[:id])
			if @comment.nil?
				redirect_to request.referrer || root_url
			end
		end
end
