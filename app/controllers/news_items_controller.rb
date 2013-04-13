class NewsItemsController < ApplicationController

  def index
    @tweets = Twitter.search('#edchat OR #education', :count => 10, :result_type => 'popular').statuses

    @tag_recent_media = Instagram.tag_recent_media('edchat', :count => 1)
    @location_recent_media = Instagram.location_recent_media(82197239)
  end

end
