require 'set'

class EolData < SiteData
  def self.report_type; return self.to_s; end

  def self.get_eol_ids_from_name(name)
    get_api_result(search_url(name), ["results", "id"])
  end
  
  PAGES_DATA = {
    "eol_id" => ["identifier"],
    "richness" => ["richness_score"],
    "ranks" => ["taxonConcepts", "taxonRank"],
    "scientificName" => ["scientificName"],
    "he_ids" => ["taxonConcepts", ["identifier", "nameAccordingTo"]]
  }
  
  def self.data(id)
    result = get_api_results(pages_url(id), PAGES_DATA)
    if result
      children = eol_children(filter_hes(result["he_ids"]))
      result["children"] = children if children.length > 0
    end
    result
  end
  
  BAD_PROVIDERS = ["GBIF Nub Taxonomy"]
  
  def self.filter_hes(hes_with_provider)
    if hes_with_provider
      result = Set.new
      hes_with_provider.each do |he, provider|
        result << he unless BAD_PROVIDERS.member?(provider)
      end
      result
    end
  end
  
  HE_DATA = {
    "children" => ["children", "taxonConceptID"]
  }
  
  def self.eol_children(he_ids)
    result = Set.new
    if he_ids
      he_ids.each do |he_id|
        result += (get_api_results(hierarchy_entries_url(he_id), HE_DATA)["children"] || [])
      end
    end
    result.sort
  end
  
  def self.search_url(name)
    log("http://eol.org/api/search/#{URI::escape(name)}.json?exact=1&cache_ttl=86400")
  end
  
  def self.pages_url(id)
    log("http://eol.org/api/pages/#{id}.json?images=0&videos=0&sounds=0&maps=0&text=0&iucn=false&details=false&common_names=false&synonyms=false&references=false&cache_ttl=86400")
  end
  
  def self.hierarchy_entries_url(id); log("http://eol.org/api/hierarchy_entries/#{id}.json?common_names=false&synonyms=false&cache_ttl=86400"); end
end
