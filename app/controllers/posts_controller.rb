# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, except: %i[new create]
  before_action :logged_in_user, only: %i[new]

  def create
    @post = Post.new(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id,
      number: Post.where(user_id: current_user).count + 1
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

  def set_post
    @post = Post.find_by(title: params[:title], number: params[:number])
  end

  def show; end

  def edit; end

  def update
    @post.title = params[:title]
    @post.content = params[:content]
    if @post.save
      redirect_to user_url(current_user.name)
    else
      flash.now[:alert] = '更新に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = '記事を削除しました'
    redirect_to user_url(current_user.name)
  end
end
