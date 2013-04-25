class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  
  include TumblrHelper
  include InstagramHelper
  include TweetHelper
  include AuthHelper
  include RedditHelper

end
