require 'spec_helper'

describe EolData do
  subject(:eoldata) { EolData.new(taxon) }
  
  context "Gomphidiaceae" do
    let(:taxon) { Taxon.new(:name => 'Gomphidiaceae') }
  
    it "has a search url" do
      eoldata.search_url.should match(/api\/search\/Gomphidiaceae.json/)
    end
  
    it "has a pages url" do
      id = eoldata.ids[0]
      eoldata.pages_url(id).should match(/api\/pages\/#{id}.json/)
    end
  
    it "has at least one id" do
      eoldata.ids.length.should > 0
    end
  end
end
