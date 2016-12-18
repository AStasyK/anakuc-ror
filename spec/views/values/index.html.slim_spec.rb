require 'rails_helper'

RSpec.describe "values/index", type: :view do
  before(:each) do
    assign(:values, [
      Value.create!(
        :user_id => 2,
        :image_id => 3,
        :value => 4
      ),
      Value.create!(
        :user_id => 2,
        :image_id => 3,
        :value => 4
      )
    ])
  end

  it "renders a list of values" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
