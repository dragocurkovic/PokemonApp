module Api
  module V1
    class MovesController < RestrictionsController
      def index
        moves = Move.all
        render json: moves, each_serializer: MoveSerializer
      end

      def show
        move = Move.find(params[:id])
        render json: move, serializer: MoveSerializer
      end
    end
  end
end
