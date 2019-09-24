class SetDefaultHealth < ActiveRecord::Migration
  def change
    change_column :pokemon_battles, :first_pokemon_hp, :integer, default: 100
    change_column :pokemon_battles, :second_pokemon_hp, :integer, default: 100
  end
end
