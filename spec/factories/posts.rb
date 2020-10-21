FactoryBot.define do
  factory :post do
    title {'gdddd'}
    sequence(:content) { |n| "post#{n}" }
    association :user
    number {1}
  end
end
