class PokemonOwnershipsController < AuthenticatedController
  def index
  end

  def create
    @pokemon_ownership ||= PokemonOwnership.new(user: current_user,
                                                pokemon_id: params[:pokemon_id],
                                                move_ids: params[:move_ids])
    if @pokemon_ownership.save
      redirect_to pokemon_ownerships_path
    else
      redirect_to pokemon_path(params[:pokemon_id]), alert: 'Cannot claim pokemon!'
    end
  end

  def edit
    @pokemon_ownership = PokemonOwnership.find(params[:id])
  end

  def update
    @pokemon_ownership = PokemonOwnership.find(params[:id])
    @pokemon_ownership.update(permitted_params)
    render :edit
  end

  def destroy
    @pokemon_ownership = PokemonOwnership.find(params[:id])
    @pokemon_ownership.destroy
  end

  private

  def permitted_params
    params.require(:pokemon_ownership).permit(:avatar)
  end
end
