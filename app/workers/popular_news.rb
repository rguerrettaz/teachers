class PopularNews
	include Sidekiq::Worker
  include Api
  
  
  def perform
<<<<<<< HEAD
    search = [from_twitter,from_reddit, from_insta, from_twitter, from_tumblr].flatten!
=======
    search = [from_insta, from_tumblr, from_twitter, from_reddit].flatten!
>>>>>>> integrated background worker w/errors though
  end 

end

# PopularNews.perform_async
