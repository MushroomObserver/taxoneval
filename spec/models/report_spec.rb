require 'spec_helper'

describe Report do
  it "has a valid factory" do
    expect(FactoryGirl.create(:report)).to be_valid
  end
  
  it "is invalid without a taxon name" do
    expect(FactoryGirl.build(:report, name: nil)).not_to be_valid
  end
  
  it ".fields" do
    expect(FactoryGirl.create(:report).fields.class).to eq(Array)
  end
  
  it ".taxon_items" do
    expect(FactoryGirl.create(:report).taxon_items).to eq([])
  end
  
  it ".taxon_items by EOL richness" do
    expect(FactoryGirl.create(:report).taxon_items(["EolData", "richness"], false)).to eq([])
  end
  
  it ".data_dump" do
    expect(FactoryGirl.create(:report).data_dump).to eq("")
  end
  
  it ".add_taxon_name" do
    report = FactoryGirl.create(:report)
    taxa_before = Taxon.count
    taxon_data_before = TaxonDatum.count
    species = 'Chroogomphus asiaticus'
    report.add_taxon_name(species)
    expect(report.taxons.length).to eq(1)
    expect(report.taxons[0].name).to match(/^#{species}/)
    expect(Taxon.count).to be > taxa_before
    expect(TaxonDatum.count).to be > taxon_data_before
    report.destroy
    expect(Taxon.count).to eq(taxa_before)
    expect(TaxonDatum.count).to eq(taxon_data_before)
  end
  
  context "Cystogomphus" do
    let(:taxon) {"Cystogomphus"}
    let(:report) {FactoryGirl.build(:report, name: taxon).add_taxon_name(taxon)}

    it ".add_taxon_name adds children" do
      expect(report.taxons.length).to be > 1
    end

    it ".taxon_items with data" do
      expect(report.taxon_items.length).to be > 1
    end

    it ".taxon_items with data" do
      expect(report.taxon_items(["EolData", "richness"], false)).to eq([[["Cystogomphus", "http://eol.org/21510"], "Genus", "12.5031"], [["Cystogomphus humblotii Singer 1942", "http://eol.org/190465"], "Species", "5.48392"]])
    end
  end
end
