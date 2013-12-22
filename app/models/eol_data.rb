class EolData < SiteData
  def initialize(taxon)
    super()
    @taxon = taxon
    @hash[:ids] = get_api_result(search_url, ["results", "id"])
    @hash[:urls] = @hash[:ids].map{|id| "http://eol.org/#{id}"}
  end
  
  def search_url
    "http://eol.org/api/search/#{@taxon}.json?exact=1"
  end
end
