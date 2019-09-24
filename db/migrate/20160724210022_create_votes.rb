class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :upvoted

      t.timestamps null: false
    end
  end
end
