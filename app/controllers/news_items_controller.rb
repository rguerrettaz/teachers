class NewsItemsController < ApplicationController
  include ApplicationHelper

  def index

    @tweets = tweets

    @tag_recent_media = Instagram.tag_recent_media('edchat', :count => 1)
    @location_recent_media = Instagram.location_recent_media(82197239)

    @tumbles = tumbles

  end

end
