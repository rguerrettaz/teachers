class NewsItemsController < ApplicationController

  def index
    @tweets = Twitter.search('#edchat OR #education', :count => 10, :result_type => 'popular').statuses
  end

end
