class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) 
    end
  end

  helper_method :current_user

  private

  def check_login
    if session[:user_id].blank?
      redirect_to login_path, alert: "ログインしてください"
    else
      @current_user = User.find(session[:user_id])
    end 
  end
end
