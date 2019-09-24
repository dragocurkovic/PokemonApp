require 'rails_helper'

RSpec.describe PokemonsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:pokemon) { FactoryGirl.create(:pokemon) }

  before { sign_in user }

  describe 'GET #index' do
    it 'renders the index template' do
      get :index

      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, id: pokemon

      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end
end
