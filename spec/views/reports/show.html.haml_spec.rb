require 'spec_helper'

describe "reports/show" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :taxon => "Taxon"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Taxon/)
    rendered.should match(/EOL Id/)
    rendered.should match(/EOL URL/)
    rendered.should match(/eol.org/)
  end
end
