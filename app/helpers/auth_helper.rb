module AuthHelper

  def sign_in(user)
  	# cookies[:id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  	current_user
  end

  def current_user
  	@current_user ||= User.find_by_remember_token(cookies[:remember_token]) if cookies[:remember_token]
  end

  def logged_in?
  	cookies[:remember_token] != nil
  end

end
