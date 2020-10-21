FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user000#{n}" }
    password {'user0001'}
    avatar { Rack::Test::UploadedFile.new(File.open(Rails.root.join('app', 'assets', 'images', 'default.png'))) }
    display_name{'user2'}
    profile {'yorosiku'}
  end
end