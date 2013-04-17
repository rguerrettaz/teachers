class PopularNews
	include Api
	include Sidekiq::Worker

  def perform
    search = [from_twitter, from_reddit, from_insta, from_twitter, from_tumblr].flatten!
  end 

end

# PopularNews.perform_async