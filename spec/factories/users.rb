FactoryBot.define do
  factory :user do
      sequence(:email) { |n| "user#{n}@example.com" }
      sequence(:username) { |n| "user#{n}" }
      password { 'password' }
      password_confirmation { "password" }
      first_name { "John" }
      last_name { "Doe" }
  end
end
