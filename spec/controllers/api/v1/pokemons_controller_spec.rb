require 'rails_helper'

RSpec.describe Api::V1::PokemonsController, type: :controller do
  include ApiDoc::V1::Pokemon::Api
  let!(:user) { FactoryGirl.create(:user) }
  let(:pokemon) { FactoryGirl.create(:pokemon) }

  before do
    set_api_headers(user)
  end

  describe 'GET #index' do
    include ApiDoc::V1::Pokemon::Index
    it 'should return success' do
      get :index

      expect(subject.status).to eq(200)
      expect(parsed_response.count).to eq(1)
    end
  end

  describe 'GET #show' do
    include ApiDoc::V1::Pokemon::Show
    it 'should return success' do
      get :show, id: pokemon

      expect(response.status).to eq(200)
      expect(parsed_response.count).to eq(1)
    end
  end
end
