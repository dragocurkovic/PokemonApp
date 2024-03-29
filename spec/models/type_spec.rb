RSpec.describe Type, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should have_many :pokemons }
  it { should have_many :moves }
end
