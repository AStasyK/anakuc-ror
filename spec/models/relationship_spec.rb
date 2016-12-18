require 'rails_helper'

RSpec.describe Relationship, type: :model do
  subject { described_class.new(followed_id: 1, follower_id: 2) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a user_id' do
    subject.followed_id = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without an image_id' do
    subject.followed_id = nil
    expect(subject).to_not be_valid
  end
  it 'belongs to Followed' do
    assoc = described_class.reflect_on_association(:followed)
    expect(assoc.macro).to eq :belongs_to
  end
  it 'belongs to Follower' do
    assoc = described_class.reflect_on_association(:follower)
    expect(assoc.macro).to eq :belongs_to
  end
end
