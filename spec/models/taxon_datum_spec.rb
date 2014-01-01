require 'spec_helper'

describe TaxonDatum do
  it "has a valid factory" do
    expect(FactoryGirl.create(:taxon_datum)).to be_valid
  end
  
  it ".data_dump" do
    expect(FactoryGirl.create(:taxon_datum).data_dump).to match(/TaxonDatum: \([0-9]+\) \[report_type: My Report Type, key: My Key, value: My Value\]/)
  end
end
