class UsersController < ApplicationController
    before_action :find_user, only: [:show,:edit,:update, :destroy]

#users lists
def index
    @users = User.all
end

#each user show route
def show
  
end

#signup route or new user route
def new
    @user = User.new
end

#new user action
def create
    @user = User.new(user_params)
    if @user.save
        flash[:notice] = "User created successfully"
        redirect_to posts_path
    else
      render 'new'
    end
end

#edit user route
def edit
end

#edit user action
def update
    @user = User.update(user_params)
    if @user.save
        flash[:notice] = "User updated successfully"
        redirect_to posts_path
    else
      render 'edit'
    end
end

#deletes user action
def destroy
    if @user.destroy
        flash[:notice] = "Account deleted"
        redirect_to root_path
    else
        flash[:alert] = "Unable to delete account"
    end
end



private

def user_params
    params.require(:user).permit(:username,:email, :password, :profileImage)
end

def find_user
    @user = User.find(params[:id]) 
end

end
