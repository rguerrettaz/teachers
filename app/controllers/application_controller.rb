class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  include TumblrHelper
  include InstagramHelper
  
end
