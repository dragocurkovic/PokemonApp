class AddPokemonOwnershipToPokemonBattleRound < ActiveRecord::Migration
  def change
    remove_column :pokemon_battle_rounds, :pokemon_id
    add_reference :pokemon_battle_rounds, :pokemon_ownership, index: true, foreign_key: true
  end
end
