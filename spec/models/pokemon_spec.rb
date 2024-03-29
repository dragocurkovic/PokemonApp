RSpec.describe Pokemon, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(20) }

  it { should validate_presence_of :type }

  it { should belong_to :type }
end
