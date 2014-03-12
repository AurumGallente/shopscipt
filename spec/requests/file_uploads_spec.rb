require 'spec_helper'

describe "upload" do
  it "can upload a license" do
    visit upload_path
    attach_file "upload_file", "#{Rails.root}/spec/fixtures/files/price.xls"
    click_button "Upload"
    page.should have_content("File uploaded")    
  end
end
