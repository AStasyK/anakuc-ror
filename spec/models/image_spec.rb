require 'rails_helper'

RSpec.describe Image, type: :model do
  subject { described_class.new(file: 'File', ave_value: 4.5) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a file path' do
    subject.file = nil
    expect(subject).to_not be_valid
  end
end
