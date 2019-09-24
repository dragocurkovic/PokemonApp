require 'rails_helper'

RSpec.describe Api::V1::TypesController, type: :controller do
  include ApiDoc::V1::Type::Api
  let!(:user) { FactoryGirl.create(:user) }
  let(:type) { FactoryGirl.create(:type) }

  before do
    set_api_headers(user)
  end

  describe 'GET #index' do
    include ApiDoc::V1::Type::Index
    it 'should return success' do
      get :index

      expect(subject.status).to eq(200)
      expect(parsed_response.count).to eq(1)
    end
  end

  describe 'GET #show' do
    include ApiDoc::V1::Type::Show
    it 'should return success' do
      get :show, id: type

      expect(response.status).to eq(200)
      expect(parsed_response.count).to eq(1)
    end
  end
end
