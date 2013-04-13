class NewsItemsController < ApplicationController
  include ApplicationHelper

  def index

    @tweets = tweets

    @instas = instas
    # @location_recent_media = Instagram.location_recent_media(82197239)

    @tumbles = tumbles

    @trial = tweets

  end

end
