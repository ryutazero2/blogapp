module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    #受け取ったユーザーがログイン中と一致する場合true
    def current_user?(user)
        user == current_user
    end
    #ログインしている時true
    def logged_in?
        !current_user.nil?
    end
end
