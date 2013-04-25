class PopularNews
	include Api
	include Sidekiq::Worker

  def perform
    from_twitter
    from_reddit
    from_tumblr
    from_insta
  end

end

# PopularNews.perform_async to refresh manually or rake admin:refresh
