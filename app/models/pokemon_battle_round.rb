class PokemonBattleRound < ActiveRecord::Base
  belongs_to :pokemon_battle
  belongs_to :pokemon_ownership
  belongs_to :move

  has_one :user, through: :pokemon_ownership

  validates :pokemon_ownership, presence: true
  validates :move, presence: true
end
