FactoryGirl.define do
  factory :user do
    sequence(:username, 3) { |n| "user#{n}" }
    sequence(:email, 3) { |n| "person#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
