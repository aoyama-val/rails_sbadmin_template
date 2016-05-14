class SessionsController < ApplicationController
  layout "login"
  before_action :check_login, except: [:login, :create, :logout]
  
  def login
  end

  def create
    email = params[:email]
    password = params[:password]

    # 認証をちゃんとやるには
    # rails g model user name:string password_digest:string
    #
    # # app/model/usres.rb
    # class User < ActiveRecord::Base 
    #   has_secure_password 
    # end 
    # 
    # # rails console
    # User.create!(:name => "admin", :password => "hoge", :password_confirmation => "hoge")
    #
    # http://qiita.com/regonn/items/4c76d4f3ef6c6af5c5e5
    if true
      session[:user_id] = 1 
      redirect_to "/sessions/test", notice: "ログインしました"
    else
      @error = "メールアドレスまたはパスワードが一致しません"
      render "new"
    end 
  end 

  def logout
    session.delete(:user_id)
    redirect_to "/", notice: "ログアウトしました"
  end 

  def test
  end 
end
