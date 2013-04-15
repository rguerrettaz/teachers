class NewsItemsController < ApplicationController

  def index

    # @location_recent_media = Instagram.location_recent_media(82197239)
    
    search = [from_twitter, from_insta].flatten!
    @popular = search.sort_by { |item| item.popularity }.reverse!

    @recent = from_tumblr.sort_by { |item| item.popularity }.reverse!
    
  end

end
