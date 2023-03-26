FactoryBot.define do
  factory :user do
    first_name { "Testing" }
    last_name { "User" }
    gender { 1 }
    sequence(:email) {|n| "test+#{n}@test.com"}
    date_of_birth { "1992-02-10" }
    password { "987654321" }
    password_confirmation { "987654321" }
  end
end
