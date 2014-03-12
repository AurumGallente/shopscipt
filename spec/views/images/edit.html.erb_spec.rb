require 'spec_helper'

describe "images/edit" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :image => "MyString",
      :imageable_id => 1,
      :imageable_type => "MyString"
    ))
  end

  it "renders the edit image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", image_path(@image), "post" do
      assert_select "input#image_image[name=?]", "image[image]"
      assert_select "input#image_imageable_id[name=?]", "image[imageable_id]"
      assert_select "input#image_imageable_type[name=?]", "image[imageable_type]"
    end
  end
end
