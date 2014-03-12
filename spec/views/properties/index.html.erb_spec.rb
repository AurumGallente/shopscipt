require 'spec_helper'

describe "properties/index" do
  before(:each) do
    assign(:properties, [
      stub_model(Property,
        :name => "Name",
        :image => "Image",
        :propertyable_id => 1,
        :propertyable_type => "Propertyable Type"
      ),
      stub_model(Property,
        :name => "Name",
        :image => "Image",
        :propertyable_id => 1,
        :propertyable_type => "Propertyable Type"
      )
    ])
  end

  it "renders a list of properties" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Propertyable Type".to_s, :count => 2
  end
end
