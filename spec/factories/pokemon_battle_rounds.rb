FactoryGirl.define do
  factory :pokemon_battle_round do
    pokemon_battle
    pokemon_ownership
    move

    damage 50
  end
end
