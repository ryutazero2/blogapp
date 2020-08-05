class ApplicationController < ActionController::Base
    rescue_from Exception, with: :logged_in_user
    include SessionsHelper

    private
    # ログイン済みユーザーかどうか確認
    def logged_in_user(e)
        @exception = e
        redirect_to login_url unless logged_in?
    end

    # ログイン状態を確認する
    def forbid_login_user
        if @current_user 
            flash[:notice] = 'すでにログインしています'
            redirect_to root_path
        end
    end
    
end
