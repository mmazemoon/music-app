class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  # fetches the user we've logged in as
  def current_user
    # @current_user ||=
     User.find_by(session_token: session[:session_token])
  end
end

# controllers will always have the params and session hash available to them
# session hash - a form of an encrypted cookie
