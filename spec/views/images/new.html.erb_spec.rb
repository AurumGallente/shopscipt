require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image,
      :image => "MyString",
      :imageable_id => 1,
      :imageable_type => "MyString"
    ).as_new_record)
  end

  it "renders new image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", images_path, "post" do
      assert_select "input#image_image[name=?]", "image[image]"
      assert_select "input#image_imageable_id[name=?]", "image[imageable_id]"
      assert_select "input#image_imageable_type[name=?]", "image[imageable_type]"
    end
  end
end
