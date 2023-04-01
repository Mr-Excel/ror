FactoryBot.define do
  factory :image do
    url { "MyString" }
    is_active { false }
    imageable { nil }
  end
end
