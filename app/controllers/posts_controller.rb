# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new]

  def create
    @post = Post.new(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id
    )
    if @post.save
      flash[:notice] = '記事を投稿しました'
      redirect_to user_url(current_user.name)
    else
      @title = params[:title]
      @content = params[:content]
      flash.now[:alert] = @post.errors.full_messages
      render 'new'
    end
  end

  def show
    @posts = Post.find(params[:id])
  end
end
