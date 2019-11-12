class ApplicationController < ActionController::Base
helper_method :current_user, :requre_login

private 


def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end


def require_login
    unless current_user
      redirect_to root_path 
    end
  end
end
