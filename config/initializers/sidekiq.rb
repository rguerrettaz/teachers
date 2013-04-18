# heroku_config = YAML.load_file("#{Rails.root}/config/heroku.yml")
# ENV['HEROKU_API_KEY'], ENV['HEROKU_APP']  = heroku_config["key"], heroku_confing["app_name"]

# require 'autoscaler/sidekiq'
# require 'autoscaler/heroku_scaler'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDISTOGO_URL"] }
end unless ENV['REDISTOGO_URL'].blank?

# Sidekiq.configure_client do |config|
#   config.client_middleware do |chain|
#     chain.add Autoscaler::Sidekiq::Client, 'default' => Autoscaler::HerokuScaler.new
#   end
# end

# Sidekiq.configure_server do |config|
#   config.server_middleware do |chain|
#     chain.add(Autoscaler::Sidekiq::Server, Autoscaler::HerokuScaler.new, 60)
#   end
# end
