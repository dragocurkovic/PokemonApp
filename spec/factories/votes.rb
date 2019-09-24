FactoryGirl.define do
  factory :vote do
    upvoted false
    pokemon
    user
  end
end
