require 'spec_helper'

describe "reports/index" do
  before(:each) do
    assign(:reports, [
      stub_model(Report,
        :taxon => "Taxon"
      ),
      stub_model(Report,
        :taxon => "Taxon"
      )
    ])
  end

  it "renders a list of reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Taxon".to_s, :count => 2
  end
end
