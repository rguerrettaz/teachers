module AuthHelper

  def sign_in(user)
  	cookies[:id] = user.id
  	current_user
  end

  def current_user
  	@current_user ||= User.find(cookies[:id]) if cookies[:id]
  end

  def logged_in?
  	cookies[:id] != nil
  end

end