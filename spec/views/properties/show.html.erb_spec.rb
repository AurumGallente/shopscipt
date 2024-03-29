require 'spec_helper'

describe "properties/show" do
  before(:each) do
    @property = assign(:property, stub_model(Property,
      :name => "Name",
      :image => "Image",
      :propertyable_id => 1,
      :propertyable_type => "Propertyable Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Image/)
    rendered.should match(/1/)
    rendered.should match(/Propertyable Type/)
  end
end
