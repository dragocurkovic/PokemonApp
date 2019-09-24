class AddPokemonToVote < ActiveRecord::Migration
  def change
    add_reference :votes, :pokemon, index: true, foreign_key: true
  end
end
