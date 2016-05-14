class PagesController < ApplicationController
  before_action :check_login

  def index
  end

  def login
    render :layout => 'login'
  end

  def error
  end

  def no_privilege
    return if check_privilege(:always_false) == false
    render :text => "OK"    # never reach here
  end
end
