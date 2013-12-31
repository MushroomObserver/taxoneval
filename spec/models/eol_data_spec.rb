require 'spec_helper'

describe EolData do
  subject(:eoldata) { EolData.new(taxon) }
  
  context "Gomphidiaceae" do
    let(:family) { 'Gomphidiaceae' }
    let(:id) { EolData.default_ids[family][0] }
  
    it ".get_eol_ids_from_name" do
      expect(EolData.get_eol_ids_from_name(family)).to eq([5955])
    end
    
    it ".data" do
      expect(EolData.data(id)["scientificName"]).to eq([family])
    end
    
    it ".search_url" do
      expect(EolData.search_url(family)).to match(/api\/search\/#{family}.json/)
    end
  
    it ".pages_url" do
      expect(EolData.pages_url(id)).to match(/api\/pages\/#{id}.json/)
    end

    it ".hierarchy_entries_url" do
      expect(EolData.hierarchy_entries_url(id)).to match(/api\/hierarchy_entries\/#{id}.json/)
    end
  
  end
end
