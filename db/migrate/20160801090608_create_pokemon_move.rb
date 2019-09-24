class CreatePokemonMove < ActiveRecord::Migration
  def change
    create_table :pokemon_moves do |t|
      t.references :move, index: true, foreign_key: true
      t.references :pokemon_ownership, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
