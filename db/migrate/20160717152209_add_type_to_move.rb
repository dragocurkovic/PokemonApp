class AddTypeToMove < ActiveRecord::Migration
  def change
    add_reference :moves, :type, index: true, foreign_key: true
  end
end
