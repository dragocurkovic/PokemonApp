class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string  :name
      t.integer :height
      t.integer :weight
      t.integer :base_experience
      t.string  :image

      t.timestamps null: false
    end
  end
end
