require 'spec_helper'

describe "characteristics/show" do
  before(:each) do
    @characteristic = assign(:characteristic, stub_model(Characteristic,
      :characteristicable_id => 1,
      :characteristicable_type => "Characteristicable Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Characteristicable Type/)
  end
end
