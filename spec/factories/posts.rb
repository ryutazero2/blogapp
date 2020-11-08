FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "title#{n}" }
    sequence(:content) { |n| "post#{n}" }
    association :user
    number {1}
    created_at {Time.now}
  end
end
