FactoryGirl.define do
  factory :pokemon_ownership do
    pokemon
    user

    before(:create) do |pokemon_ownership|
      pokemon_ownership.moves << create_list(:move, 2)
    end
  end
end
