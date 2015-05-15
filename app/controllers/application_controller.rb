class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  # fetches the user we've logged in as
  def current_user
    # @current_user ||=
     User.find_by(session_token: session[:session_token])
  end

  # set session[session_token] signs them in
  def log_in_user!(user)
    session[:session_token] = user.session_token.reset_session_token!
  end

  def log_out_user
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    session[:session_token] == current_user.session_token
  end
end

# controllers will always have the params and session hash available to them
# session hash - a form of an encrypted cookie
