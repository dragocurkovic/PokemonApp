class AddTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :token_hash, :string
  end
end
