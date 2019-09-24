require 'rails_helper'

RSpec.describe Api::V1::MovesController, type: :controller do
  include ApiDoc::V1::Move::Api
  let!(:user) { FactoryGirl.create(:user) }
  let(:move) { FactoryGirl.create(:move) }

  before do
    set_api_headers(user)
  end

  describe 'GET #index' do
    include ApiDoc::V1::Move::Index
    it 'should return success' do
      get :index

      expect(subject.status).to eq(200)
      expect(parsed_response.count).to eq(1)
    end
  end

  describe 'GET #show' do
    include ApiDoc::V1::Move::Show
    it 'should return success' do
      get :show, id: move

      expect(response.status).to eq(200)
      expect(parsed_response.count).to eq(1)
    end
  end
end
