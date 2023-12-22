class UsersController < ApplicationController
    before_action :find_user, only: [:show,:edit,:update, :destroy]
    before_action :require_user, only: [:show]
    before_action :require_exact_user, only: [:edit,:update, :destroy]
    
#users lists
def index
    @users = User.all
end

#each user show route
def show
    @posts = @user.posts.paginate(page: params[:page], per_page: 10) 
end

#signup route or new user route
def new
    @user = User.new
end

#new user action
def create
    @user = User.new(user_params)
   
    if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Account created successfully"
        redirect_to @user
    else
      render 'new'
    end
end

#edit user route
def edit
end

#edit user action
def update
    if @user.update(user_params)
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
        redirect_to users_path
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

def require_exact_user
    if current_user != @user
       flash[:alert] = "You do not have permission to perform this action"
          redirect_to @user
       end
 end

end
