class ApplicationController < ActionController::Base
    include SessionsHelper

    rescue_from Exceptions::AuthError do |exception|
        redirect_to login_url
    end

    rescue_from Exceptions::PermissionError do |exception|
        render 'layouts/error.html' 
    end

    private
    # ログイン済みユーザーかどうか確認
    def logged_in_user
        fail Exceptions::AuthError unless logged_in?
    end

    # ログイン状態を確認する
    def forbid_login_user
        if current_user 
            flash[:notice] = 'すでにログインしています'
            redirect_to root_url
        end
    end

    #ログイン中以外のユーザーからのアクセスを禁止にする
    def authorize!
        fail Exceptions::PermissionError unless current_user?(User.find_by(name: params[:name]))
    end
end
