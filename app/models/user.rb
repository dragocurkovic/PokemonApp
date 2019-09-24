class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
  has_many :comments, dependent: :destroy
  has_many :pokemon_ownerships
  has_many :pokemons, through: :pokemon_ownerships

  validates :username, uniqueness: true

  def token
    token_rand = SecureRandom.urlsafe_base64
    token_hash = ::BCrypt::Password.create(token_rand)
    update(token_hash: token_hash)
    token_rand
  end

  def valid_token?(token)
    ::BCrypt::Password.new(token_hash) == token
  end
end
