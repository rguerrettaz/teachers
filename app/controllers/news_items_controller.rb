class NewsItemsController < ApplicationController

  def index

    # @location_recent_media = Instagram.location_recent_media(82197239)
    
    @news_items = from_tumblr.sort_by { |item| item.popularity }.reverse!

  end

end
