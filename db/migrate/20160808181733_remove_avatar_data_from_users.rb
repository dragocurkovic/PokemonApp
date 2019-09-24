class RemoveAvatarDataFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_data
  end
end
