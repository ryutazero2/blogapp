class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :delete_user, :destroy]
  before_action :ensure_correct_user, only:[:edit, :update, :delete_user, :destroy]
  before_action :forbid_login_user, only:[:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      display_name: params[:name],
      profile: 'よろしくお願いします')
    if @user.save
      flash[:notice] = '登録しました'
      session[:user_id] = @user.id
      @user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.png')), filename: 'default.png', content_type: 'image/png')
      redirect_to user_url(@user.name)
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
    @user.avatar.attach(params[:avatar]) if params[:avatar].present?
    @user.profile = params[:profile]
    @user.display_name = params[:display_name] if params[:display_name].present?
    if @user.save
      redirect_to user_url(@user.name)
    else
      render 'edit'
    end
  end

  def delete_user
    @user = User.find_by(name: params[:name])
  end

  def destroy
    @user = User.find_by(name: params[:name])
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  def ensure_correct_user
    if @current_user.name != params[:name]
      flash[:notice] = '権限がありません'
      redirect_to root_path
    end
  end
end
