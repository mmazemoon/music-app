class UsersController < ApplicationController

  # get /photos/new => return an HTML form for creating a new photo
  def new
    @user = User.new
    render :new
  end

  # get /photos/:id/edit  => return an HTML form for editing a photo
  def edit

  end

  # render :template, go into views and put on page template.
  # redirect_to url, will call corresponding method.
  # post /photos => create a new photo to the index of all photos
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user.id)
    else
      render :new
    end
  end

  # get /photos   => return a list (index) of all photos
  def index

  end

  # delete /photos/:id => delete specific photo
  def destroy

  end

  # get /photos/:id => display a specific photo
  def show

  end

  # put/patch /photos/:id  => update a specific photo
  def update

  end

private

  # where does this come from? scope includes view.
  def user_params
    params.require(:user).permit(:email, :password)
  end





end


# edit is like new
# update is like create
