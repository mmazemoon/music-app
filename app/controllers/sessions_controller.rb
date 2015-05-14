class SessionsController < ApplicationController

  def create
    # fail
    em = params[:user][:email]
    pw = params[:user][:password]
    @user = User.find_by_credentials(em, pw)
      if @user && @user.is_password?(pw)
        redirect_to user_url(@user)
      else
        flash[:errors] = "Wrong username or password"
        @user = User.new(email: em)
        render :new
      end
  end

    # sign up page
  def new
    @user = User.new
    render :new
  end

  def destroy
  end

end
