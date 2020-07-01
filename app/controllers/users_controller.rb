class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(name: params[:name])
    @user.save
    redirect_to("/")
  end
end
