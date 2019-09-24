module ApiDoc
  module V1
    module Pokemon
      include Dox::DSL::Syntax

      document :api do
        group do
          name 'Pokemon'
        end

        resource do
          name 'Pokemon'
          endpoint '/pokemons'
          group 'Pokemon'
          desc 'Pokemon'
        end
      end

      document :index do
        action do
          name 'Get pokemons [GET /pokemons]'
          desc 'Returns list of pokemons'
        end
      end

      document :show do
        action do
          name 'Get pokemon [GET /pokemons/{id}]'
          params id: { type: :number, required: :required, value: 1, description: 'pokemon id' }
        end
      end
    end
  end
end
