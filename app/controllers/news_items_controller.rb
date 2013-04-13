class NewsItemsController < ApplicationController


  def index


    # @tweets = Twitter.search('#edchat OR #education', :count => 10, :result_type => 'popular').statuses

    client = Tumblr::Client.new
    @tumbles = client.tagged('education', :limit => 10)



  end

end
