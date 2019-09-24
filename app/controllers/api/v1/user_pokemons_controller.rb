module Api
  module V1
    class UserPokemonsController < RestrictionsController
      def index
        user = User.find(params[:user_id])

        render json: user.pokemons, each_serializer: PokemonSerializer
      end
    end
  end
end
