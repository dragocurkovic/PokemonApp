require 'rails_helper'

RSpec.describe PokemonBattleRoundsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:move) { FactoryGirl.create(:move) }
  let!(:pokemon_battle) { FactoryGirl.create(:pokemon_battle) }
  let!(:pokemon_ownership) { FactoryGirl.create(:pokemon_ownership) }
  let(:pokemon_battle_round) { FactoryGirl.create(:pokemon_battle_round) }

  before { sign_in user }

  describe '#create' do
    it 'should redirect to Arena show page' do
      post :create, attributes_for(:pokemon_battle_round, move_id: move,
                                                          pokemon_battle_id: pokemon_battle,
                                                          pokemon_ownership_id: pokemon_ownership)

      expect(response).to redirect_to(pokemon_battle_path(id: pokemon_battle))
    end
  end
end
