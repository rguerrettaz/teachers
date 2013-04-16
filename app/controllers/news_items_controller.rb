class NewsItemsController < ApplicationController

  def index
    
  end

  def load_from_apis
    search = [from_twitter].flatten!
    @news_items = search.sort_by { |item| item.popularity }.reverse!
    render :json => render_to_string(:partial => 'news_items', :locals => {:news_items => @news_items}).to_json
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
