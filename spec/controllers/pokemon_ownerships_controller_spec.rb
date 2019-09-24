require 'rails_helper'

RSpec.describe PokemonOwnershipsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let(:pokemon) { FactoryGirl.create(:pokemon) }
  let(:move) { FactoryGirl.create(:move) }
  let!(:pokemon_ownership) { FactoryGirl.create(:pokemon_ownership) }

  before { sign_in user }

  describe '#index' do
    it 'should render My Profile page' do
      get :index

      expect(response).to be_success
    end

    it 'should render the index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    it 'should redirect to edit page' do
      post :create, pokemon_id: pokemon.id, move_ids: [move.id]

      expect(response).to redirect_to(pokemon_ownerships_path)
    end

    it 'should create a new pokemon ownership' do
      expect do
        post :create, pokemon_id: pokemon.id, move_ids: [move.id]
      end.to change(PokemonOwnership, :count).by(1)
    end

    it 'when invalid should redirect to pokemon_path' do
      post :create, pokemon_id: pokemon.id

      expect(response).to redirect_to(pokemon_path(pokemon.id))
    end
  end

  describe 'GET #edit' do
    it 'should be successfull' do
      get :edit, id: pokemon_ownership

      expect(response).to be_success
    end
  end

  describe 'PUT #update' do
    it 'should be successfull' do
      put :update, id: pokemon_ownership,
                   pokemon_ownership: attributes_for(:pokemon_ownership, avatar: nil)

      expect(response).to be_success
    end

    it 'should render the edit template' do
      put :update, id: pokemon_ownership,
                   pokemon_ownership: attributes_for(:pokemon_ownership, avatar: nil)

      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete a pokemon ownership' do
      expect do
        xhr :delete, :destroy, id: pokemon_ownership.id
      end.to change(PokemonOwnership, :count).by(-1)
    end

    it 'should be successfull' do
      xhr :delete, :destroy, id: pokemon_ownership.id

      expect(response).to be_success
    end

    it 'should render the destroy template' do
      xhr :delete, :destroy, id: pokemon_ownership.id

      expect(response).to render_template(:destroy)
    end
  end
end
