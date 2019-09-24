FactoryGirl.define do
  factory :pokemon_battle do
    association :first_pokemon_ownership, factory: :pokemon_ownership
    association :second_pokemon_ownership, factory: :pokemon_ownership
  end
end
