class NewsItemsController < ApplicationController
  def index
    if request.xhr?
      search = [from_twitter, from_reddit, from_insta].flatten!
      @news_items = search.sort_by { |item| item.popularity }.reverse!

      # @news_items = NewsItem.order_by_popularity.limit(25)
      render :json => render_to_string(:partial => 'news_items', :locals => {:news_items => @news_items}).to_json
    end
  end

	def create
		@news_items = NewsItem.new
	end

  def test
    search = [from_insta].flatten!
    @news_items = search.sort_by { |item| item.popularity }.reverse!
  end


  def show
    @news_item = NewsItem.find(params[:id])
  end

end

# create a sidekiq worker that does this:
  # make the calls to the apis
  # populate the database
  #search = [from_twitter].flatten!
  #@news_items = search.sort_by { |item| item.popularity }.reverse!
