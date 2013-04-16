class PopularNews
	include Sidekiq::Worker
  
  def perform
    search = [from_twitter].flatten!
  end 

end

# PopularNews.perform_async