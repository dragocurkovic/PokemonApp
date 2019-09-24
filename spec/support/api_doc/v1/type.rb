module ApiDoc
  module V1
    module Type
      include Dox::DSL::Syntax

      document :api do
        group do
          name 'Type'
        end

        resource do
          name 'Type'
          endpoint '/types'
          group 'Type'
          desc 'Type'
        end
      end

      document :index do
        action do
          name 'Get types [GET /types]'
          desc 'Returns list of types'
        end
      end

      document :show do
        action do
          name 'Get type [GET /types/{id}]'
          params id: { type: :number, required: :required, value: 1, description: 'type id' }
        end
      end
    end
  end
end
