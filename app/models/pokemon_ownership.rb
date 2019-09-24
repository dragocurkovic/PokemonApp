class PokemonOwnership < ActiveRecord::Base
  include ImageUploader[:avatar]

  belongs_to :user
  belongs_to :pokemon

  has_many :pokemon_moves, dependent: :destroy
  has_many :moves, through: :pokemon_moves

  belongs_to :pokemon_battle, dependent: :destroy

  validates :pokemon_moves, length: { minimum: 1, maximum: 4 }
  validates :user_id, uniqueness: { scope: :pokemon_id }
end
