FactoryBot.define do
  factory :user_dependent do
    user { nil }
    dependent { nil }
  end
end
