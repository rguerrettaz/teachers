require_relative '../../app/models/popular_news.rb'

namespace :admin  do
	desc "refresh homepage"
	task :refresh do
	   PopularNews.perform_async
	end
end