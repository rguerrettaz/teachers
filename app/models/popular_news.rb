class PopularNews
	include ApiSearchCriteria
	include TumblrApi
	include TwitterApi
	include InstagramApi
	include RedditApi
	include Sidekiq::Worker

  def perform
    TwitterApi.from_twitter
    RedditApi.from_reddit
    TumblrApi.from_tumblr
    InstagramApi.from_insta
  end

end

# PopularNews.perform_async to refresh manually or rake admin:refresh
