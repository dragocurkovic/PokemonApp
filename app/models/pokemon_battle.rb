class PokemonBattle < ActiveRecord::Base
  belongs_to :first_pokemon_ownership, class_name: 'PokemonOwnership'
  belongs_to :second_pokemon_ownership, class_name: 'PokemonOwnership'
  belongs_to :winner, class_name: 'PokemonOwnership'

  has_one :first_pokemon, through: :first_pokemon_ownership, source: :pokemon
  has_one :second_pokemon, through: :second_pokemon_ownership, source: :pokemon

  has_one :user, through: :first_pokemon_ownership
  has_one :opponent, through: :second_pokemon_ownership, source: :user

  has_many :pokemon_battle_rounds, dependent: :destroy

  enum battle_status: { active: 0, upcoming: 1, finished: 2 }

  validates :first_pokemon_ownership, presence: true
  validates :second_pokemon_ownership, presence: true, on: :update

  def user_for_next_turn
    last_turn_user = pokemon_battle_rounds.order(:created_at).last.try(:user)
    return opponent if user == last_turn_user
    user
  end

  def moves_for_user_turn
    ownership_for_next_turn.moves
  end

  def ownership_for_next_turn
    return first_pokemon_ownership if user_for_next_turn == user
    second_pokemon_ownership
  end
end
