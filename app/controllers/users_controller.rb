class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      image_name: "default_user.jpg")
    if @user.save
      flash[:notice] = '登録しました'
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.name}"
    else
      render('users/new')
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
    @user.profile = params[:profile]
    if @user.save
      redirect_to "/users/#{@user.name}"
    else
      render('users/edit')
    end
  end
end
