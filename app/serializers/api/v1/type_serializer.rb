module Api
  module V1
    class TypeSerializer < ActiveModel::Serializer
      attribute :name

      has_many :pokemons, serializer: PokemonSerializer
      has_many :moves, serializer: MoveSerializer
    end
  end
end
