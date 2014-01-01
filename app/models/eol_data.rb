require 'set'

class EolData < SiteData
  def self.report_type; return self.to_s; end

  DEFAULT_IDS = {
    "Gomphidiaceae" => [5955],
    "Chroogomphus" => [2000],
    "Chroogomphus rutilus" => [3000],
    "Chroogomphus asiaticus" => [3500],
    "Gomphidius" => [4000],
    "Gomphidius glutinosus" => [5000]
  }
  
  def self.default_ids
    DEFAULT_IDS
  end
  
  DEFAULT_DATA = {
    5955 => {
      "eol_id" => 5955,
      "richness" => 1.2,
      "ranks" => ["family"], # May want to make this deterministic
      "scientificName" => "Gomphidiaceae", # Does authority and date need to be removed?
      "children" => [2000, 4000]
    },
    2000 => {
      "eol_id" => 2000,
      "richness" => 2.3,
      "ranks" => ["genus"],
      "scientificName" => "Chroogomphus",
      "children" => [3000]
    },
    3000 => {
      "eol_id" => 3000,
      "richness" => 3.4,
      "ranks" => ["species"],
      "scientificName" => "Chroogomphus rutilus",
      "children" => []
    },
    3500 => {
      "eol_id" => 3500,
      "richness" => 3.5,
      "ranks" => ["species"],
      "scientificName" => "Chroogomphus asiaticus",
      "children" => []
    },
    4000 => {
      "eol_id" => 4000,
      "richness" => 4.5,
      "ranks" => ["genus"],
      "scientificName" => "Gomphidius",
      "children" => [5000]
    },
    5000 => {
      "eol_id" => 5000,
      "richness" => 5.6,
      "ranks" => ["species"],
      "scientificName" => "Gomphidius glutinosus",
      "children" => []
    },
  }
  
  def self.get_eol_ids_from_name(name)
    get_api_result(search_url(name), ["results", "id"]) || DEFAULT_IDS[name]
  end
  
  PAGES_DATA = {
    "eol_id" => ["identifier"],
    "richness" => ["richness_score"],
    "ranks" => ["taxonConcepts", "taxonRank"],
    "scientificName" => ["scientificName"],
    "he_ids" => ["taxonConcepts", "identifier"],
  }
  
  def self.data(id)
    result = get_api_results(pages_url(id), PAGES_DATA)
    if result
      children = eol_children(result["he_ids"])
      result["children"] = children if children.length > 0
    end
    result || DEFAULT_DATA[id]
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
