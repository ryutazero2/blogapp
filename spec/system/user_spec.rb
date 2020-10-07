require 'rails_helper'

RSpec.describe 'Users', type: :system do
    it "ユーザーを新規追加する" do
        user = FactoryBot.build(:user)
        visit register_path
        fill_in 'Name', with: user.name 
        fill_in 'password', with: user.password
        click_button '新規追加'
    end
end