class PopularNews
	include Api
	include Sidekiq::Worker

  def perform
    search = [from_twitter, from_reddit, from_tumblr, from_insta].flatten!
  end

end

# PopularNews.perform_async to refresh manually or rake admin:refresh
