require 'rails_helper'

RSpec.describe "images/new", type: :view do
  before(:each) do
    assign(:image, Image.new(
      :file => "MyString",
      :ave-value => 1.5
    ))
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", images_path, "post" do

      assert_select "input#image_file[name=?]", "image[file]"

      assert_select "input#image_ave-value[name=?]", "image[ave-value]"
    end
  end
end
