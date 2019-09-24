require 'rails_helper'

RSpec.describe ArenaController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:pokemon_ownership) { FactoryGirl.create(:pokemon_ownership) }
  let(:pokemon_battle) { FactoryGirl.create(:pokemon_battle) }

  before { sign_in user }

  describe '#index' do
    it 'should render Arena page' do
      get :index

      expect(response).to be_success
    end

    it 'should render the index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe '#show' do
    it 'should render Arena#show page' do
      get :show, id: pokemon_battle

      expect(response).to be_success
    end

    it 'should render the show template' do
      get :show, id: pokemon_battle

      expect(response).to render_template(:show)
    end
  end

  describe 'PUT #update' do
    it 'should render index template' do
      put :update, id: pokemon_battle, pokemon_ownership_id: pokemon_ownership

      expect(response).to redirect_to(pokemon_battles_path)
    end

    it 'should join the battle' do
      put :update, id: pokemon_battle, pokemon_ownership_id: pokemon_ownership

      expect(pokemon_battle).to have_attributes(battle_status: 'active')
    end
  end

  describe 'POST #create' do
    it 'should render index template' do
      post :create, pokemon_ownership: pokemon_ownership

      expect(response).to redirect_to(pokemon_battles_path)
    end

    it 'should create new battle' do
      expect do
        post :create, pokemon_ownership: pokemon_ownership
      end.to change(PokemonBattle, :count).by(1)
    end
  end
end
