require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :image => "Image",
        :imageable_id => 1,
        :imageable_type => "Imageable Type"
      ),
      stub_model(Image,
        :image => "Image",
        :imageable_id => 1,
        :imageable_type => "Imageable Type"
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Imageable Type".to_s, :count => 2
  end
end
