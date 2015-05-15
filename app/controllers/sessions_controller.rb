class SessionsController < ApplicationController

  # signs a user in
  def create
    em = params[:user][:email]
    pw = params[:user][:password]

    @user = User.find_by_credentials(em, pw)
      if @user && @user.is_password?(pw)
        @user.reset_session_token!
        session[:session_token] = @user.session_token
        redirect_to users_url(@user)
      else
        flash.now[:errors] = "Wrong username or password"
        @user = User.new(email: em)
        render :new
      end
  end

# presents log in form
  def new
    @user = User.new
    render :new
  end

# sign a user out
  def destroy
    session[:session_token] = nil
    @user.reset_session_token!
    redirect_to new_session_url
  end

end
