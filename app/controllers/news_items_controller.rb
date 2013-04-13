class NewsItemsController < ApplicationController

  def index

    # @location_recent_media = Instagram.location_recent_media(82197239)
    
    search = [from_tumblr, from_insta].flatten!
    @news_items = search.sort_by { |item| item.popularity }.reverse!


    # @news_items = from_insta.sort_by { |item| item.popularity }.reverse!

  end

end
