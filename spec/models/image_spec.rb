require 'rails_helper'

RSpec.describe Image, type: :model do
  subject { described_class.new(file: 'File', ave_value: 4.5, category_id: 1) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a file path' do
    subject.file = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a category id' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end
  it 'belongs to Category' do
    assoc = described_class.reflect_on_association(:category)
    expect(assoc.macro).to eq :belongs_to
  end
end
