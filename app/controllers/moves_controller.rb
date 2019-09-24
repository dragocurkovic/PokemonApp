class MovesController < AuthenticatedController
  def index
    @moves = Move.all
  end
end
