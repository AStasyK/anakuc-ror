require 'rails_helper'

RSpec.describe Value, type: :model do
  subject { described_class.new(user_id: 1, image_id: 2, value: 4) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without an image_id' do
    subject.image_id = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a value from a user' do
    subject.value = nil
    expect(subject).to_not be_valid
  end
end
