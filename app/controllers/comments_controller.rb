class CommentsController < ApplicationController

	def create
		news_item = NewsItem.find(params[:news_item_id])
		@comment = news_item.comments.new(params[:comment])
		@comment.user = current_user
		@comment.save
		respond_to do |format|
			format.json do
				render :json => render_to_string(:partial => 'comment', :locals => {:comment => @comment}).to_json
			end
		end
	end

end
