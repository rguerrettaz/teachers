class NewsItemsController < ApplicationController

  def index
    @tweets = Twitter.search('#edchat OR #education')
  end

end
