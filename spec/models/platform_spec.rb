require 'rails_helper'

RSpec.describe Platform, type: :model do
  subject { described_class.new(family: 'Play Station', name: 'Play Station Portable', category_id: 1,  image_id: 1) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a family' do
    subject.family = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a category id' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without an image_id' do
    subject.image_id = nil
    expect(subject).to_not be_valid
  end
  it 'is valid without a name' do
    subject.name = nil
    expect(subject).to be_valid
  end
  it 'has one Image' do
    assoc = described_class.reflect_on_association(:image)
    expect(assoc.macro).to eq :belongs_to
  end
  it 'has one Category' do
    assoc = described_class.reflect_on_association(:category)
    expect(assoc.macro).to eq :belongs_to
  end
end
