class AddPokemonBattleToPokemonBattleRound < ActiveRecord::Migration
  def change
    add_reference :pokemon_battle_rounds, :pokemon_battle, index: true, foreign_key: true
  end
end
