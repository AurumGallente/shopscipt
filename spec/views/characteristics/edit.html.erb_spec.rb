require 'spec_helper'

describe "characteristics/edit" do
  before(:each) do
    @characteristic = assign(:characteristic, stub_model(Characteristic,
      :characteristicable_id => 1,
      :characteristicable_type => "MyString"
    ))
  end

  it "renders the edit characteristic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", characteristic_path(@characteristic), "post" do
      assert_select "input#characteristic_characteristicable_id[name=?]", "characteristic[characteristicable_id]"
      assert_select "input#characteristic_characteristicable_type[name=?]", "characteristic[characteristicable_type]"
    end
  end
end
