class NewsItemsController < ApplicationController
  include ApplicationHelper

  def index


    @tweets = tweets

    @tumbles = tumbles



  end

end
