class NewsItemsController < ApplicationController

  def index

    # @location_recent_media = Instagram.location_recent_media(82197239)

    search = [from_tumblr, from_twitter, from_insta, from_reddit].flatten!
    @news_items = search.sort_by { |item| item.popularity }.reverse!


  end

  def test
  	   @api = search = [from_twitter].flatten!
    # @news_items = search.sort_by { |item| item.popularity }.reverse!
  end

  def show
  	@news_item = news_item.find(params[:id])
  end

end
