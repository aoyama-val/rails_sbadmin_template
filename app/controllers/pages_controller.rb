class PagesController < ApplicationController
  def index
  end

  def login
    render :layout => 'login'
  end

  def error
  end
end
