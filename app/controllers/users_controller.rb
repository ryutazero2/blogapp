class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      profile: "よろしくお願いします")
    if @user.save
      flash[:notice] = '登録しました'
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.name}"
    else
      @name = params[:name]
      render 'new'
    end
  end

  def show
    @user = User.find_by(name: params[:name])
  end

  def edit
    @user = User.find_by(name: params[:name])
  end

  def update
    @user = User.find_by(name: params[:name])
    @user.avatar.attach(params[:avatar])
    @user.profile = params[:profile]
    @user.displayname = params[:displayname]
    if @user.save
      redirect_to "/users/#{@user.name}"
    else
      render 'edit'
    end
  end

  def delete
    @user = User.find_by(name: params[:name])
  end

  def destory
    @user = User.find_by(name: params[:name])
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
end
