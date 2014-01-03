require 'spec_helper'

describe Taxon do
  it "has a valid factory" do
    expect(FactoryGirl.create(:taxon)).to be_valid
  end
  
  it "is invalid without an eol_id" do
    expect(FactoryGirl.build(:taxon, eol_id: nil)).not_to be_valid
  end
  
  it "is invalid without a name" do
    expect(FactoryGirl.build(:taxon, name: nil)).not_to be_valid
  end
  
  it ".add_data" do
    taxon = FactoryGirl.create(:taxon)
    taxon.add_data("Test", {"ranks" => ["Sp.", "Species", "sp."], "richness" => ["1.2", "5.6", "3.4"], "children" => ["1", "2", "3"]})
    expect(taxon.data("Test", "ranks")).to eq(["Species"])
    expect(taxon.data("Test", "richness")).to eq(["5.6"])
    expect(taxon.data("Test", "children")).to eq(["1", "2", "3"])
  end
end
