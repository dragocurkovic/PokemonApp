class Type < ActiveRecord::Base
  has_many :pokemons
  has_many :moves

  validates :name, presence: true, uniqueness: true
end
