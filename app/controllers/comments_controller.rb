class CommentsController < ApplicationController
	def new
    	@comment = current_user.comments.build
  	end

	def create
		@comment = current_user.comments.build(comment_params)
		@place = Place.find(params[:place_id])	
		@comment.place_id = @place.id
		@comment.save
		redirect_to place_path(@place)
	end

	def destroy
		@place = Place.find(params[:place_id])
		@comment = @place.comments.find(params[:id])
		@comment.destroy
		redirect_to place_path(@place)
	end


	private
	def comment_params
      params.require(:comment).permit(:body, :user_id, :place_id)
    end
end
