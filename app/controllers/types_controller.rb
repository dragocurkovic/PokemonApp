class TypesController < AuthenticatedController
  def index
    @types = Type.all
  end
end
