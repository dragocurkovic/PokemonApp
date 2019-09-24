class ArenaController < AuthenticatedController
  def index
    @pokemon_battles =
      PokemonBattle
      .joins('INNER JOIN pokemon_ownerships ON first_pokemon_ownership_id = pokemon_ownerships.id
              OR second_pokemon_ownership_id = pokemon_ownerships.id')
      .where('user_id = ? OR second_pokemon_ownership_id IS NULL', current_user)

    if params[:battle_status].present?
      @pokemon_battles = @pokemon_battles.where(battle_status: parse_battle_status)
    end
  end

  def show
    @pokemon_battle = PokemonBattle.find(params[:id])
  end

  def update
    @pokemon_battle =
      PokemonBattle.find(params[:id])
                   .update(second_pokemon_ownership_id: params[:pokemon_ownership_id],
                           battle_status: PokemonBattle.battle_statuses['active'])
    redirect_to pokemon_battles_path
  end

  def create
    @pokemon_battle = PokemonBattle.create(first_pokemon_ownership_id: params[:pokemon_ownership],
                                           battle_status: PokemonBattle.battle_statuses['upcoming'])
    redirect_to pokemon_battles_path
  end

  private

  def parse_battle_status
    PokemonBattle.battle_statuses[params[:battle_status]]
  end
end
