class EolData < SiteData
  REPORT_TYPE = 'EOL'

  def initialize(taxon)
    super()
    @taxon = taxon
    @ids = get_api_result(search_url, ["results", "id"]) || [5955]
    @ids.each do |id|
      # td = TaxonDatum.new(:taxon => taxon, :report_type => REPORT_TYPE, :key => "id", :value => id)
      # Pretty sure this can be done in the constructor, but simple hash didn't work
      # td.taxon = taxon
      # td.report_type = REPORT_TYPE
      # td.key = "id"
      # td.value = id
      # td.save
    end
    
    # @hash[:urls] = @hash[:ids].map{|id| "http://eol.org/#{id}"}
    
    # These could be combined
    # @hash[:richnesses] = @hash[:ids].map {|id| get_api_result(pages_url(id), ["richness_score"]) || 0}
    # @hash[:identifiers] = @hash[:ids].map {|id| get_api_result(pages_url(id), ["taxonConcepts", "identifier"]) || 0}
    # @hash[:children] = @hash[:identifiers].map {|id| get_api_result(hierarchy_entries_url(id), ["children", "taxonConceptID"]) || 0}
  end
  
  def taxon_name
    @taxon.name
  end
  
  def ids
    @ids
  end
  
  # def search_url; "http://eol.org/api/search/#{@taxon.name}.json?exact=1&cache_ttl=86400"; end
  def search_url; "http://eol.org/api/search/#{@taxon.name}.json?exact=1&cache_ttl=86400"; end
  
  def pages_url(id)
    "http://eol.org/api/pages/#{ids[0]}.json?images=0&videos=0&sounds=0&maps=0&text=0&iucn=false&details=false&common_names=false&synonyms=false&references=false&cache_ttl=86400"
  end
  
  def hierarchy_entries_url(id); "http://eol.org/api/hierarchy_entries/1.0/#{id}.json?common_names=false&synonyms=false&cache_ttl=86400"; end
end
