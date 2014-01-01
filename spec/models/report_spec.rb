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
  
  it ".eol_id_index for missing taxon" do
    expect(FactoryGirl.create(:report).eol_id_index(0)).to be_nil
  end
  
  it ".add_taxon_name" do
    report = FactoryGirl.create(:report)
    species = 'Chroogomphus asiaticus'
    report.add_taxon_name(species)
    expect(report.taxons.length).to eq(1)
    expect(report.taxons[0].name).to match(/^#{species}/)
  end
  
  it ".add_taxon_name adds children" do
    report = FactoryGirl.create(:report)
    genus = 'Chroogomphus'
    report.add_taxon_name(genus)
    expect(report.taxons.length > 1).to be_true
  end
end
