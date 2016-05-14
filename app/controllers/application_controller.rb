class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) 
    end
  end

  def has_privilege(privilege)
    case privilege
    when :add_user
    when :always_false
      return false
    end
    return false
  end

  def check_privilege(privilege)
    if not has_privilege(privilege)
      redirect_to root_path, alert: "権限がありません"
      return false
    end
    return true
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
