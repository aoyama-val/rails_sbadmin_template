class PagesController < ApplicationController
  before_action :check_login

  def index
  end

  def login
    render :layout => 'login'
  end

  def error
  end
end
