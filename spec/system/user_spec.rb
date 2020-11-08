require 'rails_helper'
RSpec.describe 'Users', type: :system do
    describe 'ユーザー関連機能' do
        let(:user_attributes) { FactoryBot.build(:user) } 
        let(:user) { FactoryBot.create(:user) } 
        
        describe 'ログイン前' do
            describe 'ユーザー新規登録' do
                context 'フォームの入力値が正常' do
                    it 'ユーザーの新規作成が成功' do
                        visit register_path
                        fill_in 'Name', with: user_attributes.name 
                        fill_in 'password', with: user_attributes.password
                        click_button '新規追加'
                        expect(current_path).to eq user_path(user_attributes.name)
                        expect(page).to have_content 'blogappへようこそ！'
                    end
                end

                context 'ユーザーが未入力' do
                    it 'ユーザの新規作成に失敗' do
                        visit register_path
                        fill_in 'password', with: user_attributes.password
                        click_button '新規追加'
                        expect(page).to have_content 'ユーザー名を入力してください'
                    end
                end

                context 'パスワードが未入力' do
                    it 'ユーザーの新規作成に失敗' do
                        visit register_path
                        fill_in 'Name', with: user_attributes.name 
                        click_button '新規追加'
                        expect(page).to have_content 'パスワードを入力してください'
                    end
                end

                context '同じユーザーを入力' do
                    before do 
                        FactoryBot.create(:user, name: 'test')
                    end

                    it 'ユーザの新規作成に失敗' do
                        visit register_path
                        fill_in 'Name', with: 'test'
                        fill_in 'password', with: user_attributes.password
                        click_button '新規追加'
                        expect(page).to have_content 'ユーザー名はすでに存在します'
                    end
                end
                

            end
        end

        describe 'ログイン後' do
            before do
                login(user)
            end

            describe 'ユーザー編集' do
                context '全て入力する' do
                    it 'ユーザー編集に成功する' do
                        visit edit_user_path(user.name)
                        fill_in 'display_name', with: user.display_name
                        fill_in 'profile', with: user.profile
                        click_button '更新'
                        expect(current_path).to eq user_path(user.name)
                    end
                end
            end
        
            describe 'ユーザー退会' do
                context 'ユーザーを退会させる' do
                    it 'ユーザーの退会に成功する' do
                        visit delete_user_path(user.name)
                        find('a', text: '退会する').click
                        accept_confirm
                        expect(current_path).to eq root_path
                        expect(page).to have_content '退会しました'
                    end
                end
            end

        end
    end
end