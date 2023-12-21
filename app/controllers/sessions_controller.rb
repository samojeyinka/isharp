class SessionsController < ApplicationController
    def new
    end

    #new session login
    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Signed in successfully"
            redirect_to user
        else
            flash.now[:alert] = "Invalid username or password"
            render 'new'
        end
    end

    #signout user
    def destroy
        session[:user_id] = nil
        flash.now[:alert] = "You signed out"
        redirect_to root_path
    end
end