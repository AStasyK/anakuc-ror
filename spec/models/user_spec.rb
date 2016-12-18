require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'User1', email: 'user@mail.com', password: '12345qwerty!', password_confirmation: '12345qwerty!') }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a category id' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a genre' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid when the password is under 6 chars' do
    subject.password = '656y'
    expect(subject).to_not be_valid
  end
  it 'is not valid when the name is over 50 chars' do
    subject.name = '453teredgergegderged]fgdfgdfgdfgdfgerergegedrfg55gergedrge5tergerge5656y'
    expect(subject).to_not be_valid
  end
  it 'is not valid when the email has invalid format' do
    subject.email = '5gdf6yheggrf'
    expect(subject).to_not be_valid
  end
  it 'is not valid when password doesn\'t pass password confirmation' do
    subject.password_confirmation = '5gdf6yheggrf'
    expect(subject).to_not be_valid
  end
  it 'has many Games' do
    assoc = described_class.reflect_on_association(:games)
    expect(assoc.macro).to eq :has_and_belongs_to_many
  end
  it 'has many Followers' do
    assoc = described_class.reflect_on_association(:followers)
    expect(assoc.macro).to eq :has_many
  end
  it 'has many Followeds' do
    assoc = described_class.reflect_on_association(:followeds)
    expect(assoc.macro).to eq :has_many
  end
end
