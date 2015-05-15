class SessionsController < ApplicationController

  # signs a user in
  def create
    em = params[:user][:email]
    pw = params[:user][:password]

    @user = User.find_by_credentials(em, pw)
      if @user && @user.is_password?(pw)
        log_in_user!(user)
        redirect_to users_url
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
    log_out_user
    redirect_to new_session_url
  end
end
