class CreatePokemonBattleRounds < ActiveRecord::Migration
  def change
    create_table :pokemon_battle_rounds do |t|
      t.integer :damage
      t.references :move, index: true, foreign_key: true
      t.references :pokemon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
