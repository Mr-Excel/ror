FactoryBot.define do
  factory :user_team do
    user
    team
    is_active { true }
  end
end
