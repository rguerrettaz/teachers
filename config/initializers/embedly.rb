Embedly.configure do |config|
  # prints debug messages to the logger
  config.debug = true

  # use a custom logger
  # config.logger = MyAwesomeLogger.new(STDERR)

  # disable typhoeus and use Net::HTTP instead
  config.typhoeus = false
end
