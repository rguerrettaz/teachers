class NewsItemsController < ApplicationController
  include ApplicationHelper

  def index


    # @tweets = Twitter.search('#edchat OR #education', :count => 10, :result_type => 'popular').statuses

    client = Tumblr::Client.new
    search = client.tagged('education', :limit => 5)

    @tumbles = add_popularity(search)



  end

end
