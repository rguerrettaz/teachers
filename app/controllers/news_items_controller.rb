class NewsItemsController < ApplicationController

  def index

    @tweets = Twitter.search('#edchat OR #education', :count => 10, :result_type => 'popular').statuses


    @tag_recent_media = Instagram.tag_recent_media('edchat', :count => 1)
    @location_recent_media = Instagram.location_recent_media(82197239)

    client = Tumblr::Client.new

    @tumbles = client.tagged('education', :limit => 3)

    url = 'http://www.guardian.co.uk/media/2011/jan/21/andy-coulson-phone-hacking-statement'

    embedly_api = Embedly::API.new :key => '2ed47f41ebd743b1a2a04f95e93ad430'

    @obj = embedly_api.oembed :url => url


  end

end
