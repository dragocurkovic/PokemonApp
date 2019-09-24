require 'rails_helper'

RSpec.describe PokemonCommentsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:comment) { FactoryGirl.create(:comment) }
  let(:pokemon) { FactoryGirl.create(:pokemon) }

  before { sign_in user }

  describe 'POST #create' do
    context 'when given valid data' do
      it 'should create a new comment' do
        expect do
          xhr :post, :create, pokemon_id: pokemon.id
        end.to change(Comment, :count).by(1)
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
end
