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
