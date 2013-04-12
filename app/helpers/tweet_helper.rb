module TweetHelper

  def embed_tweet(tweet_id)
    @html = Twitter.get("https://api.twitter.com/1/statuses/oembed.json?id=#{tweet_id}")[:body][:html].html_safe
  end

end
