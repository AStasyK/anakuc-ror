require 'rails_helper'

RSpec.describe GamingSystem, type: :model do
  subject { described_class.new(game_id: 1, platform_id: 2) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a user_id' do
    subject.game_id = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without an image_id' do
    subject.platform_id = nil
    expect(subject).to_not be_valid
  end
end
