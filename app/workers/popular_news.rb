class PopularNews
	include Sidekiq::Worker
  include Api
  
  def perform
    search = [from_insta, from_tumblr, from_twitter, from_reddit].flatten!
  end 

end

# PopularNews.perform_async
