require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  let!(:user) do
    FactoryGirl.create(:user,
                       email: 'drago.curkovic@live.com',
                       password: '1234567',
                       password_confirmation: '1234567')
  end

  describe 'POST #create' do
    it 'should return success' do
      post :create, email: 'drago.curkovic@live.com', password: '1234567'

      expect(subject.status).to eq(200)
    end
  end
end
