class PokemonMove < ActiveRecord::Base
  belongs_to :pokemon_ownership
  belongs_to :move
end
