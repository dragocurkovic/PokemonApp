module Api
  module V1
    class PokemonSerializer < ActiveModel::Serializer
      attribute :name
      attribute :base_experience
      attribute :height
      attribute :weight
      attribute :image

      belongs_to :type, serializer: TypeSerializer
      has_many :moves, serializer: MoveSerializer
    end
  end
end
