require 'spec_helper'

describe "characteristics/index" do
  before(:each) do
    assign(:characteristics, [
      stub_model(Characteristic,
        :characteristicable_id => 1,
        :characteristicable_type => "Characteristicable Type"
      ),
      stub_model(Characteristic,
        :characteristicable_id => 1,
        :characteristicable_type => "Characteristicable Type"
      )
    ])
  end

  it "renders a list of characteristics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Characteristicable Type".to_s, :count => 2
  end
end
