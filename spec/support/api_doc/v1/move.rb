module ApiDoc
  module V1
    module Move
      include Dox::DSL::Syntax

      document :api do
        group do
          name 'Move'
        end

        resource do
          name 'Move'
          endpoint '/moves'
          group 'Move'
          desc 'Move'
        end
      end

      document :index do
        action do
          name 'Get moves [GET /moves]'
          desc 'Returns list of moves'
        end
      end

      document :show do
        action do
          name 'Get move [GET /moves/{id}]'
          params id: { type: :number, required: :required, value: 1, description: 'move id' }
        end
      end
    end
  end
end
