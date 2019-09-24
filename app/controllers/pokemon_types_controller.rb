class PokemonTypesController < AuthenticatedController
  def show
    @type = Type.find_by(name: params[:name])
  end
end
