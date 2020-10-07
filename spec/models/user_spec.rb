require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザー、パスワード、表示名、プロフィールを登録できる" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "ユーザー名に-_を入れることができる登録できる" do
    expect(FactoryBot.build(:user,name: "-_user-_")).to be_valid
  end

  it "ユーザー名がない場合登録できない" do
    expect(FactoryBot.build(:user, name: "")).to_not be_valid 
  end

  it "ユーザー名に-_以外の記号は利用できない" do
    expect(FactoryBot.build(:user, name: "*><gregre")).to_not be_valid 
  end

  it "ユーザー名に21文字以上入力できない" do
    expect(FactoryBot.build(:user, name: "123456784567890123456")).to_not be_valid 
  end

  it "パスワードは8文字以上ないと登録できない" do
    expect(FactoryBot.build(:user, password: "1234567")).to_not be_valid 
  end

  it "パスワードがないと登録できない" do
    expect(FactoryBot.build(:user, password: "")).to_not be_valid 
  end

  it "表示名は30文字以下じゃないと登録できない" do
    expect(FactoryBot.build(:user, display_name: "1234567890123456789012345678901")).to_not be_valid 
  end

  it "プロフィールは150文字以内じゃないと登録できない" do
    expect(FactoryBot.build(:user,
      profile: "1234567890123456789012345678901234567890
                1234567890123456789012345678901234567890
                1234567890123456789012345678901234567890
                1234567890123456789012345678901")).to_not be_valid 
  end

end
