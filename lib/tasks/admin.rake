namespace :admin  do
	desc "refresh homepage"
	task :refresh => :environment do
	   PopularNews.perform_async
	end
end
