require 'rails_helper'

RSpec.describe Api::V1::UserPokemonsController, type: :controller do
  include ApiDoc::V1::UserPokemons::Api
  let!(:user) { FactoryGirl.create(:user) }

  before do
    set_api_headers(user)
  end

  describe 'GET #index' do
    include ApiDoc::V1::UserPokemons::Index
    it 'should return success' do
      get :index, user_id: user

      expect(subject.status).to eq(200)
    end
  end
end
