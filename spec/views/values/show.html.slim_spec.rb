require 'rails_helper'

RSpec.describe "values/show", type: :view do
  before(:each) do
    @value = assign(:value, Value.create!(
      :user_id => 2,
      :image_id => 3,
      :value => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
