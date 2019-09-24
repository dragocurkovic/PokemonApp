module Api
  module V1
    class MoveSerializer < ActiveModel::Serializer
      attribute :name
      attribute :accuracy
      attribute :effect_chance
      attribute :pp
      attribute :priority
      attribute :power

      belongs_to :type, serializer: TypeSerializer
    end
  end
end
