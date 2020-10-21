require 'rails_helper'
RSpec.describe 'Posts', type: :system do
    describe '投稿機能' do
        let(:user4) { FactoryBot.create(:user) } 
        let(:post) { FactoryBot.build(:post) } 
        let(:post2){ FactoryBot.create(:post) } 
        before do
            login(user4)
        end

        describe '記事を投稿する' do
            context '全て入力する' do
                it 'ブログの投稿に成功する' do
                    visit blogs_new_path
                    fill_in 'title', with: post.title
                    fill_in_rich_text_area 'content', with: post.content
                    click_button '投稿'
                    expect(current_path).to eq user_path(user4.name)
                    expect(page).to have_content '記事を投稿しました'
                end
            end

            context 'タイトルだけ入力する' do
                it 'ブログの投稿に失敗する' do
                    visit blogs_new_path
                    fill_in 'title', with: post.title
                    fill_in_rich_text_area 'content', with: ''
                    click_button '投稿'
                    expect(page).to have_content '本文を入力してください'
                end
            end

            context '本文だけ入力する' do
                it 'ブログの投稿に失敗する' do
                    visit blogs_new_path
                    fill_in 'title', with: ''
                    fill_in_rich_text_area 'content', with: post.content
                    click_button '投稿'
                    expect(page).to have_content 'タイトルを入力してください'
                end
            end
        end

        describe '記事を編集する' do
            context '本文を編集する' do
                it '編集に成功する' do
                    visit user_edit_post_path(user4.name,post2.title,post2.number)
                    fill_in_rich_text_area 'post_content', with: post.content
                    click_button '投稿'
                    expect(current_path).to eq user_path(user4.name)
                end
            end

            context '本文を空にする' do
                it '編集に失敗する' do
                    visit user_edit_post_path(user4.name,post2.title,post2.number)
                    fill_in_rich_text_area 'post_content', with: ''
                    click_button '投稿'
                    expect(page).to have_content '更新に失敗しました'
                end
            end
        end
    end
end