class AddAvatarToPokemonOwnership < ActiveRecord::Migration
  def change
    add_column :pokemon_ownerships, :avatar_data, :text
  end
end
