FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "Testing Team-#{n}" }
  end
end
