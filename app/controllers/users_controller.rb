class UsersController < ApplicationController
  before_action :set_user, except: %i[new create]
  before_action :logged_in_user, only: %i[edit update delete_user destroy]
  before_action -> { authorize!(@user) }, only: %i[edit update delete_user destroy]
  before_action :forbid_login_user, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      display_name: params[:name],
      profile: 'よろしくお願いします'
    )
    if @user.save
      flash[:notice] = 'blogappへようこそ！'
      session[:user_id] = @user.id
      @user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.png')), filename: 'default.png', content_type: 'image/png')
      redirect_to user_url(@user.name)
    else
      @name = params[:name]
      render 'new'
    end
  end

  def set_user
    @user = User.find_by(name: params[:name])
  end

  def show; end

  def edit; end

  def update
    @user.avatar.attach(params[:avatar]) if params[:avatar].present?
    @user.profile = params[:profile]
    @user.display_name = params[:display_name] if params[:display_name].present?
    if @user.save
      redirect_to user_url(@user.name)
    else
      flash.now[:alert] = '変更に失敗しました'
      render 'edit'
    end
  end

  def delete_user; end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = '退会しました'
    redirect_to root_url
  end
end
