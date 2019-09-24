class Pokemon < ActiveRecord::Base
  belongs_to :type

  has_many   :votes
  has_many   :comments, as: :commentable
  has_many   :moves, through: :type

  validates  :name, presence: true, length: { in: 3..20 }, uniqueness: true
  validates  :type, presence: true
end
