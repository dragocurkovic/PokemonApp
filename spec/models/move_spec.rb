RSpec.describe Move, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should validate_presence_of :type }
  it { should belong_to :type }
end
