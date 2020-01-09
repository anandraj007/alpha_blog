class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :currrent_user,:log_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def log_in?
        !!current_user
    end

    def require_user
        if !log_in?
            flash[:danger] = "you must log in to perform the action"
            redirect_to root_path
        end
    end
    
end
