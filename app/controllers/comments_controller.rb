class CommentsController < ApplicationController


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
	end

	private

		def comment_params
			params.require(:comment).permit(:content, :post_id)
		end
end
