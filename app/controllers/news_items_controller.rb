class NewsItemsController < ApplicationController


  def index


    # @tweets = Twitter.search('#edchat OR #education', :count => 10, :result_type => 'popular').statuses

    client = Tumblr::Client.new
    search = client.tagged('education', :limit => 7)

    until search.length == 20
      

    end


  end

end
