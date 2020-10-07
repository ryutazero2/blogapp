require 'rails_helper'

RSpec.describe Post, type: :model do
  it "タイトルと本文が正しいこと" do
    expect(FactoryBot.create(:post)).to be_valid
  end

  it "タイトルが空の場合投稿できない" do
    expect(FactoryBot.build(:post, title: "")).to_not be_valid 
  end

  it "タイトルが256以上だと投稿できない" do
    expect(FactoryBot.build(:post, title:  "12345678901234567890123456789012345678901234567890
                                            12345678901234567890123456789012345678901234567890
                                            12345678901234567890123456789012345678901234567890
                                            12345678901234567890123456789012345678901234567890
                                            12345678901234567890123456789012345678901234567890
                                            1234567")).to_not be_valid 
  end

  it "本文が空の場合投稿できない" do
    expect(FactoryBot.build(:post, content: "")).to_not be_valid 
  end
end
