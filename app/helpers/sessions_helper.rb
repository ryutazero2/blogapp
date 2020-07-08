module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
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
