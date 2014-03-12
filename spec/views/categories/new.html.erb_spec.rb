require 'spec_helper'

describe "categories/new" do
  before(:each) do
    assign(:category, stub_model(Category,
      :name => "MyString",
      :title => "MyString",
      :description => "MyString",
      :text => "MyText"
    ).as_new_record)
  end

  it "renders new category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", categories_path, "post" do
      assert_select "input#category_name[name=?]", "category[name]"
      assert_select "input#category_title[name=?]", "category[title]"
      assert_select "input#category_description[name=?]", "category[description]"
      assert_select "textarea#category_text[name=?]", "category[text]"
    end
  end
end
