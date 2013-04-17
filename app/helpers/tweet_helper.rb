module TweetHelper
	include ApplicationHelper
	

    def embed_tweet(tweet_id)
      @html = Twitter.get("https://api.twitter.com/1/statuses/oembed.json?id=#{tweet_id}")[:body][:html].html_safe
    end

    def tweets_by_coords(lat,lng)
      @coord_tweets = Twitter.search('edchat', :geocode => "#{lat},#{lng},5mi",
                                               :result_type => 'mixed',
                                               :count => 10)
    end

end
