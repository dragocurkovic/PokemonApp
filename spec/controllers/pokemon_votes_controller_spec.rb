require 'rails_helper'

RSpec.describe PokemonVotesController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:vote) { FactoryGirl.create(:vote, user: user) }
  let(:pokemon) { FactoryGirl.create(:pokemon) }

  before { sign_in user }

  describe '#create' do
    context 'when given valid data' do
      it 'should create a new vote' do
        expect do
          xhr :post, :create, pokemon_id: pokemon.id
        end.to change(Vote, :count).by(1)
      end

      it 'should be successfull' do
        xhr :post, :create, pokemon_id: pokemon.id

        expect(response).to be_success
      end

      it 'should render the create template' do
        xhr :post, :create, pokemon_id: pokemon.id

        expect(response).to render_template(:create)
      end
    end
  end

  describe '#destroy' do
    context 'when given valid data' do
      it 'should delete a vote' do
        expect do
          xhr :delete, :destroy, pokemon_id: vote.pokemon_id
        end.to change(Vote, :count).by(-1)
      end

      it 'should be successfull' do
        xhr :delete, :destroy, pokemon_id: vote.pokemon_id

        expect(response).to be_success
      end

      it 'should render the destroy template' do
        xhr :delete, :destroy, pokemon_id: vote.pokemon_id

        expect(response).to render_template(:destroy)
      end
    end
  end
end
