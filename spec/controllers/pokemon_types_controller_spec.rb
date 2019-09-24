RSpec.describe PokemonTypesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:pokemon) { FactoryGirl.create(:pokemon) }

  before { sign_in user }

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, name: pokemon.type.name

      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end
end
