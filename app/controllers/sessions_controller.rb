class SessionsController < ApplicationController
    def new 
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully log in to your account"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Your email and password didn't match try again"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "you successfully log out "
        redirect_to root_path
    end
end