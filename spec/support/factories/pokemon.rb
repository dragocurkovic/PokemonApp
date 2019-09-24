FactoryGirl.define do
  factory :pokemon do
    sequence(:name) { |n| "pokemon#{n}" }
    type
  end
end
