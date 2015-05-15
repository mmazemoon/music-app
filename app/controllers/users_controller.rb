class UsersController < ApplicationController

#get /users/new return an HTML form to create a new User
  def new
    @user = User.new
    render :new
  end

# post /users add a user object to users
  def create
    @user = User.new(user_params)
    if @user.save
        log_in_user!(user)
        redirect_to users_url
    else
      render :new
    end
  end

  # get /users display a specific user
  def show
    @user = current_user
    render :show
  end

private

  # where does this come from? scope includes view.
  def user_params
    params.require(:user).permit(:email, :password)
  end
end

# edit is like new
# update is like create
