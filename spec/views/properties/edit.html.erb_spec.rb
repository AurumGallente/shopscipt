require 'spec_helper'

describe "properties/edit" do
  before(:each) do
    @property = assign(:property, stub_model(Property,
      :name => "MyString",
      :image => "MyString",
      :propertyable_id => 1,
      :propertyable_type => "MyString"
    ))
  end

  it "renders the edit property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", property_path(@property), "post" do
      assert_select "input#property_name[name=?]", "property[name]"
      assert_select "input#property_image[name=?]", "property[image]"
      assert_select "input#property_propertyable_id[name=?]", "property[propertyable_id]"
      assert_select "input#property_propertyable_type[name=?]", "property[propertyable_type]"
    end
  end
end
