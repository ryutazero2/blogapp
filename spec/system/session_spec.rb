require 'rails_helper'
RSpec.describe 'Session', type: :system do
    describe 'ログイン関連機能' do
        let(:user3) { FactoryBot.create(:user) } 

        describe 'ログイン' do
            context '全て入力' do
                it 'ログイン成功' do
                    visit login_path
                    fill_in 'ユーザー名', with: user3.name
                    fill_in 'パスワード', with: user3.password
                    click_button 'Login'
                    expect(current_path).to eq user_path(user3.name)
                end
            end

            context 'ユーザー名なし' do
                it 'ログイン失敗' do
                    visit login_path
                    fill_in 'ユーザー名', with: ''
                    fill_in 'パスワード', with: user3.password
                    click_button 'Login'
                    expect(page).to have_content '認証に失敗しました'
                end
            end

            context 'パスワードなし' do
                it 'ログイン失敗' do
                    visit login_path
                    fill_in 'ユーザー名', with: user3.name
                    fill_in 'パスワード', with: ''
                    click_button 'Login'
                    expect(page).to have_content '認証に失敗しました'
                end
            end
        end
=begin  
        describe 'ログアウト' do
            before do
                login(user3)
            end

            context 'ログアウトする' do
                it 'ログアウト成功' do
                    visit user_path(user3.name)
                    click_button 'ログアウト'
                    expect(current_path).to eq root_path
                    expect(page).to have_content 'ログアウトしました'
                end
            end
        end
=end
    end
end