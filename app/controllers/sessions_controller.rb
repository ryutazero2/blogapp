class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      log_in @user
      redirect_to user_url(current_user.name)
    else
      flash.now[:alert] ='認証に失敗しました'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice]='ログアウトしました'
    redirect_to root_url
  end
end
