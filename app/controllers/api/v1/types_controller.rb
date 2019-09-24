module Api
  module V1
    class TypesController < RestrictionsController
      def index
        types = Type.all
        render json: types, each_serializer: TypeSerializer
      end

      def show
        type = Type.find(params[:id])
        render json: type, serializer: TypeSerializer
      end
    end
  end
end
