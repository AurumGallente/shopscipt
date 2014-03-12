require 'spec_helper'

describe "images/show" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :image => "Image",
      :imageable_id => 1,
      :imageable_type => "Imageable Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    rendered.should match(/1/)
    rendered.should match(/Imageable Type/)
  end
end
