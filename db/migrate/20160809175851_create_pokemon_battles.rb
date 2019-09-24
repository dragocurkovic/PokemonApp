class CreatePokemonBattles < ActiveRecord::Migration
  def change
    create_table :pokemon_battles do |t|
      t.references :first_pokemon_ownership
      t.references :second_pokemon_ownership
      t.references :winner
      t.integer :first_pokemon_hp
      t.integer :second_pokemon_hp
      t.integer  :battle_status, default: 0

      t.timestamps null: false
    end
  end
end
