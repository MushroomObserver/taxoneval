require 'spec_helper'

describe TaxonDatum do
  it "has a valid factory" do
    expect(FactoryGirl.create(:taxon_datum)).to be_valid
  end
  
  it ".preferred_rank" do
    expect(FactoryGirl.create(:taxon_datum).preferred_rank("Sp.", "Species")).to eq("Species")
  end

  it ".richer" do
    expect(FactoryGirl.create(:taxon_datum).richer("1.2", "3.4")).to eq("3.4")
  end
  
  it ".add_value" do
    td = FactoryGirl.build(:taxon_datum, report_type: "Test", key: "ranks", value: "Sp.")
    td.add_value("Species")
    expect(td.value).to eq("Species")
  end

  it ".data_dump" do
    expect(FactoryGirl.create(:taxon_datum).data_dump).to match(/TaxonDatum: \([0-9]+\) \[report_type: My Report Type, key: My Key, value: My Value\]/)
  end
end
