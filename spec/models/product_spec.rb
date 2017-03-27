require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { build(:product) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_numericality_of(:price) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

  it "stripe whitespace from name and description" do
    subject.name = '   strip whitespace please     '
    subject.description = '    description     '
    subject.save
    expect(subject.name).to eq('strip whitespace please')
    expect(subject.description).to eq('description')
  end
end
