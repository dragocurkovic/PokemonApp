class PokemonBattleRoundsController < AuthenticatedController
  def create
    pokemon_battle_round = create_pokemon_battle_round
    BattleCalculator.new(pokemon_battle_round).call

    redirect_to pokemon_battle_path(id: params[:pokemon_battle_id])
  end

  private

  def create_pokemon_battle_round
    PokemonBattleRound.create(
      damage: Move.find(params[:move_id]).power || 0,
      move_id: params[:move_id],
      pokemon_battle_id: params[:pokemon_battle_id],
      pokemon_ownership_id: params[:pokemon_ownership_id]
    )
  end

  def move_damage
    Move.find(params[:move_id]).power
  end
end
