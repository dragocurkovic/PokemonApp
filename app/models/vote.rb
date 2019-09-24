class Vote < ActiveRecord::Base
  belongs_to :pokemon
  belongs_to :user

  validates :user_id, uniqueness: { scope: :pokemon_id }
end
