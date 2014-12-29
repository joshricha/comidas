class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user.create(name = )
    @user = User.new
    @user.name = params[:username]
    @user.password = params[:password]
    @user.email = params[:email]
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
        # redirect_to root_path
      else
        render :new
      end
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to login_path
  end

end