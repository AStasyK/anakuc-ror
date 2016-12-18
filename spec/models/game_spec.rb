require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { described_class.new(name: 'Game1', category_id: 2, genre: 'action', year: 2007, company: 'KOEI', image_id: 1) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a category id' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a genre' do
    subject.genre = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without an image_id' do
    subject.image_id = nil
    expect(subject).to_not be_valid
  end
  it 'is valid without a year and company' do
    subject.year = nil
    subject.company = nil
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
  it 'has many Users' do
    assoc = described_class.reflect_on_association(:users)
    expect(assoc.macro).to eq :has_and_belongs_to_many
  end
end
