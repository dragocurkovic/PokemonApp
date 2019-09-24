class Move < ActiveRecord::Base
  belongs_to :type
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true
end
