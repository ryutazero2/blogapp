require 'rails_helper'
RSpec.describe 'Session', type: :system do
    describe 'ログイン関連機能' do
        let(:user) { FactoryBot.create(:user) } 

        describe 'ログイン' do
            context '全て入力' do
                it 'ログイン成功' do
                    visit login_path
                    fill_in 'ユーザー名', with: user.name
                    fill_in 'パスワード', with: user.password
                    click_button 'Login'
                    expect(current_path).to eq user_path(user.name)
                end
            end

            context 'ユーザー名なし' do
                it 'ログイン失敗' do
                    visit login_path
                    fill_in 'ユーザー名', with: ''
                    fill_in 'パスワード', with: user.password
                    click_button 'Login'
                    expect(page).to have_content '認証に失敗しました'
                end
            end

            context 'パスワードなし' do
                it 'ログイン失敗' do
                    visit login_path
                    fill_in 'ユーザー名', with: user.name
                    fill_in 'パスワード', with: ''
                    click_button 'Login'
                    expect(page).to have_content '認証に失敗しました'
                end
            end
        end

        describe 'ログアウト' do
            before do
                login(user)
            end

            context 'ログアウトする' do
                it 'ログアウト成功' do
                    visit user_path(user.name)
                    find('a', text: 'ログアウト').click
                    expect(current_path).to eq root_path
                    expect(page).to have_content 'ログアウトしました'
                end
            end
        end
    end
end