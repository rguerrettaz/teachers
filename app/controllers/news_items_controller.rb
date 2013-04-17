class NewsItemsController < ApplicationController

  def index
      @news_items = NewsItem.limit(25)
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
