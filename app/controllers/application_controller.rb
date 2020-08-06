class ApplicationController < ActionController::Base
    include SessionsHelper
    rescue_from Exceptions::AuthError do |exception|
        redirect_to login_url
    end

    private
    # ログイン済みユーザーかどうか確認
    def logged_in_user
        fail Exceptions::AuthError unless logged_in?
    end

    # ログイン状態を確認する
    def forbid_login_user
        if @current_user 
            flash[:notice] = 'すでにログインしています'
            redirect_to root_path
        end
    end
    
end
