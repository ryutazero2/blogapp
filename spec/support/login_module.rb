module LoginModule
    def login(user)  
        visit login_path
        fill_in 'ユーザー名', with: user.name
        fill_in 'パスワード', with: user.password
        click_button 'Login'
    end
end