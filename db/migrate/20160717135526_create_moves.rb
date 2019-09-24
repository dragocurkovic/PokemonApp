class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string  :name
      t.integer :accuracy
      t.integer :effect_chance
      t.integer :pp
      t.integer :priority
      t.integer :power

      t.timestamps null: false
    end
  end
end
