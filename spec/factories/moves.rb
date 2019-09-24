FactoryGirl.define do
  factory :move do
    type
    sequence(:name) { |n| "move#{n}" }
  end
end
