class PokemonVotesController < AuthenticatedController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])

    Vote
      .find_or_initialize_by(user: current_user, pokemon: @pokemon)
      .update(upvoted: params[:upvoted])

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:pokemon_id])

    Vote
      .find_by(user: current_user, pokemon: @pokemon)
      .destroy

    respond_to do |format|
      format.js
    end
  end
end
