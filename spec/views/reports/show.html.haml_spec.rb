require 'spec_helper'

describe "reports/show" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :name => "Report Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Report Name/)
    rendered.should match(/Taxa/)
    rendered.should match(/Fields/)
    rendered.should match(/EOL Id/)
    rendered.should match(/EOL URL/)
    rendered.should match(/EOL Richness/)
    rendered.should match(/EOL Identifier/)
  end
end
