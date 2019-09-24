class BattleCalculator
  def initialize(pokemon_battle_round)
    @pokemon_battle_round = pokemon_battle_round
  end

  def call
    update_health_points_after_move
    check_and_set_winner
  end

  private

  attr_reader :pokemon_battle_round

  def pokemon_battle
    pokemon_battle_round.pokemon_battle
  end

  def damage
    pokemon_battle_round.damage
  end

  def accuracy
    pokemon_battle_round.move.accuracy || 100
  end

  def update_health_points_after_move
    if pokemon_battle_round.user == pokemon_battle.user
      update_second_pokemon_hp
    else
      update_first_pokemon_hp
    end
  end

  def update_first_pokemon_hp
    if Random.new.rand(1..100) <= accuracy
      pokemon_battle.update(first_pokemon_hp: pokemon_battle.first_pokemon_hp - damage)
    end
  end

  def update_second_pokemon_hp
    if Random.new.rand(1..100) <= accuracy
      pokemon_battle.update(second_pokemon_hp: pokemon_battle.second_pokemon_hp - damage)
    end
  end

  def check_and_set_winner
    winner = battle_winner
    return if winner.nil?

    pokemon_battle.update(battle_status: PokemonBattle.battle_statuses['finished'],
                          winner_id: winner.id)
  end

  def battle_winner
    return pokemon_battle.second_pokemon_ownership if pokemon_battle.first_pokemon_hp <= 0
    pokemon_battle.first_pokemon_ownership if pokemon_battle.second_pokemon_hp <= 0
  end
end
