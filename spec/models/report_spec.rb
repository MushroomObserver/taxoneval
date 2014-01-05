require 'spec_helper'

{
  'http://eol.org/api/hierarchy_entries/36071396.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[{"taxonConceptID"=>21561}, {"taxonConceptID"=>21510}, {"taxonConceptID"=>18511188}, {"taxonConceptID"=>21877}, {"taxonConceptID"=>6669332}, {"taxonConceptID"=>16631}, {"taxonConceptID"=>101152}]},
  'http://eol.org/api/hierarchy_entries/36071402.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[{"taxonConceptID"=>190465}]},
  'http://eol.org/api/hierarchy_entries/36071403.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[]},
  'http://eol.org/api/hierarchy_entries/36071415.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[]},
  'http://eol.org/api/hierarchy_entries/46608107.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[]},
  'http://eol.org/api/hierarchy_entries/51040676.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[{"taxonConceptID"=>21877}, {"taxonConceptID"=>16631}, {"taxonConceptID"=>21561}, {"taxonConceptID"=>11977376}]},
  'http://eol.org/api/hierarchy_entries/51040687.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[]},
  'http://eol.org/api/hierarchy_entries/52783721.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[{"taxonConceptID"=>16631,}, {"taxonConceptID"=>21877}, {"taxonConceptID"=>21561}, {"taxonConceptID"=>101152}, {"taxonConceptID"=>21510}]},
  'http://eol.org/api/hierarchy_entries/52783747.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[]},
  'http://eol.org/api/hierarchy_entries/52783755.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[{"taxonConceptID"=>190465}]},
  'http://eol.org/api/hierarchy_entries/52783756.json?common_names=false&synonyms=false&cache_ttl=86400' => {"children"=>[]},
  'http://eol.org/api/pages/0.json?images=0&videos=0&sounds=0&maps=0&text=0&iucn=false&details=false&common_names=false&synonyms=false&references=false&cache_ttl=86400' => [{"error"=>"Unknown page id \"0\""}],
  'http://eol.org/api/pages/190465.json?images=0&videos=0&sounds=0&maps=0&text=0&iucn=false&details=false&common_names=false&synonyms=false&references=false&cache_ttl=86400' => {"identifier"=>190465, "scientificName"=>"Cystogomphus humblotii Singer 1942", "richness_score"=>5.48392, "taxonConcepts"=>[{"identifier"=>52783756, "nameAccordingTo"=>"Species 2000 & ITIS Catalogue of Life: April 2013", "taxonRank"=>"Species"}, {"identifier"=>43128106, "nameAccordingTo"=>"GBIF Nub Taxonomy", "taxonRank"=>"Species"}, {"identifier"=>36071403, "nameAccordingTo"=>"Index Fungorum", "taxonRank"=>"Sp."}]},
  'http://eol.org/api/pages/21510.json?images=0&videos=0&sounds=0&maps=0&text=0&iucn=false&details=false&common_names=false&synonyms=false&references=false&cache_ttl=86400' => {"identifier"=>21510, "scientificName"=>"Cystogomphus", "richness_score"=>12.5031, "taxonConcepts"=>[{"identifier"=>52783755, "nameAccordingTo"=>"Species 2000 & ITIS Catalogue of Life: April 2013", "taxonRank"=>"Genus"}, {"identifier"=>43128105, "nameAccordingTo"=>"GBIF Nub Taxonomy", "taxonRank"=>"Genus"}, {"identifier"=>36071402, "nameAccordingTo"=>"Index Fungorum", "taxonRank"=>"Gen."}]},
  'http://eol.org/api/pages/5955.json?images=0&videos=0&sounds=0&maps=0&text=0&iucn=false&details=false&common_names=false&synonyms=false&references=false&cache_ttl=86400' => {"identifier"=>5955, "scientificName"=>"Gomphidiaceae", "richness_score"=>46.5448, "taxonConcepts"=>[{"identifier"=>52783721, "nameAccordingTo"=>"Species 2000 & ITIS Catalogue of Life: April 2013", "taxonRank"=>"Family"}, {"identifier"=>46608107, "nameAccordingTo"=>"Integrated Taxonomic Information System (ITIS)", "taxonRank"=>"Family"}, {"identifier"=>43128104, "nameAccordingTo"=>"GBIF Nub Taxonomy", "taxonRank"=>"Family"}, {"identifier"=>51040676, "nameAccordingTo"=>"NCBI Taxonomy", "taxonRank"=>"Family"}, {"identifier"=>36071396, "nameAccordingTo"=>"Index Fungorum", "taxonRank"=>"Fam."}]},
  'http://eol.org/api/pages/6669307.json?images=0&videos=0&sounds=0&maps=0&text=0&iucn=false&details=false&common_names=false&synonyms=false&references=false&cache_ttl=86400' => {"identifier"=>6669307, "scientificName"=>"Chroogomphus asiaticus O. K. Mill. & Aime 2001", "richness_score"=>6.77632, "taxonConcepts"=>[{"identifier"=>52783747, "nameAccordingTo"=>"Species 2000 & ITIS Catalogue of Life: April 2013", "taxonRank"=>"Species"}, {"identifier"=>51040687, "nameAccordingTo"=>"NCBI Taxonomy", "taxonRank"=>"Species"}, {"identifier"=>43132114, "nameAccordingTo"=>"GBIF Nub Taxonomy", "taxonRank"=>"Species"}, {"identifier"=>36071415, "nameAccordingTo"=>"Index Fungorum", "taxonRank"=>"Sp."}]},
  'http://eol.org/api/search/Chroogomphus%20asiaticus.json?exact=1&cache_ttl=86400' => {"results"=>[{"id"=>6669307}]},
  'http://eol.org/api/search/Cystogomphus.json?exact=1&cache_ttl=86400' => {"results"=>[{"id"=>21510}]},
  'http://eol.org/api/search/Gomphidiaceae.json?exact=1&cache_ttl=86400' => {"results"=>[{"id"=>5955}]},
  'http://eol.org/api/search/My%20Name.json?exact=1&cache_ttl=86400' => {"results"=>[]},
}.map {|url, response| SiteData.add_canned_response(url, response)}

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
  
  it ".data_dump" do
    expect(FactoryGirl.create(:report).data_dump).to eq("")
  end
  
  it ".eol_id_index for missing taxon" do
    expect(FactoryGirl.create(:report).eol_id_index(0)).to be_nil
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
  
  it ".add_taxon_name adds children" do
    report = FactoryGirl.create(:report)
    taxon = 'Cystogomphus'
    report.add_taxon_name(taxon)
    expect(report.taxons.length > 1).to be_true
  end
end
