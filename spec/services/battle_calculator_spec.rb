require 'rails_helper'

RSpec.describe BattleCalculator do
  let!(:first_pokemon_ownership) { FactoryGirl.create(:pokemon_ownership) }
  let!(:second_pokemon_ownership) { FactoryGirl.create(:pokemon_ownership) }

  let!(:pokemon_battle) do
    FactoryGirl.create(:pokemon_battle) do |pokemon_battle|
      pokemon_battle.first_pokemon_ownership = first_pokemon_ownership
      pokemon_battle.second_pokemon_ownership = second_pokemon_ownership
    end
  end

  def pokemon_battle_round(ownership)
    FactoryGirl.create(:pokemon_battle_round) do |pokemon_battle_round|
      pokemon_battle_round.pokemon_battle = pokemon_battle
      pokemon_battle_round.pokemon_ownership = ownership
    end
  end

  it 'should update health points for second pokemon after move by 50' do
    BattleCalculator.new(pokemon_battle_round(first_pokemon_ownership)).call

    expect(pokemon_battle.second_pokemon_hp).to eq(50)
    expect(pokemon_battle.first_pokemon_hp).to eq(100)
  end

  it 'should update health points for both pokemons after move by 50' do
    BattleCalculator.new(pokemon_battle_round(first_pokemon_ownership)).call
    BattleCalculator.new(pokemon_battle_round(second_pokemon_ownership)).call

    expect(pokemon_battle.second_pokemon_hp).to eq(50)
    expect(pokemon_battle.first_pokemon_hp).to eq(50)
  end

  it 'should update winner id' do
    BattleCalculator.new(pokemon_battle_round(first_pokemon_ownership)).call
    BattleCalculator.new(pokemon_battle_round(first_pokemon_ownership)).call

    expect(pokemon_battle.winner).to eq(first_pokemon_ownership)
  end

  it 'should update battle status' do
    BattleCalculator.new(pokemon_battle_round(first_pokemon_ownership)).call
    BattleCalculator.new(pokemon_battle_round(first_pokemon_ownership)).call

    expect(pokemon_battle.battle_status).to eq('finished')
  end
end
