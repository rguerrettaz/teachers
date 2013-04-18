class NewsItemsController < ApplicationController

  def index
    if current_user
      @user = User.find_by_remember_token(cookies[:remember_token])
    else
      @user = User.new
    end
    @news_items = NewsItem.order("popularity DESC").limit(36)
    
  end

	def create
		@news_items = NewsItem.new
	end

  def show
    @news_item = NewsItem.find(params[:id])
  end

end


# create a sidekiq worker that does this:
  # make the calls to the apis
  # populate the database
  #@news_items = search.sort_by { |item| item.popularity }.reverse!
