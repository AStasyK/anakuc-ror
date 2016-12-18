require 'rails_helper'

RSpec.describe "values/edit", type: :view do
  before(:each) do
    @value = assign(:value, Value.create!(
      :user_id => 1,
      :image_id => 1,
      :value => 1
    ))
  end

  it "renders the edit value form" do
    render

    assert_select "form[action=?][method=?]", value_path(@value), "post" do

      assert_select "input#value_user_id[name=?]", "value[user_id]"

      assert_select "input#value_image_id[name=?]", "value[image_id]"

      assert_select "input#value_value[name=?]", "value[value]"
    end
  end
end
