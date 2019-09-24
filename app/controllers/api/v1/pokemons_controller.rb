module Api
  module V1
    class PokemonsController < RestrictionsController
      def index
        pokemons = Pokemon.all
        render json: pokemons, each_serializer: PokemonSerializer
      end

      def show
        pokemon = Pokemon.find(params[:id])
        render json: pokemon, serializer: PokemonSerializer
      end
    end
  end
end
