module ApiDoc
  module V1
    module UserPokemons
      include Dox::DSL::Syntax

      document :api do
        group do
          name 'Pokemon Ownership'
        end

        resource do
          name 'UserPokemons'
          endpoint '/users/id/pokemons'
          group 'UserPokemons'
          desc 'UserPokemons'
        end
      end

      document :index do
        action do
          name 'Get pokemons [GET /users/id/pokemons]'
          desc 'Returns list of user pokemons'
        end
      end
    end
  end
end
