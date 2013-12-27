class SiteData
  def initialize
    @hash = {}
  end
  
  def keys; @hash.keys; end
  def [](key); @hash[key]; end
  
  def get_api_result(url, keys)
    begin
      process_response(HTTParty.get(url), keys)
    rescue SocketError
      nil
    end
  end

  def process_response(response, keys)
    if response.class == Array
      result = []
      response.each {|r|
        s = process_response(r, keys)
        result.push(s) unless s.nil?
      }
      result
    elsif keys == []
      response
    elsif response.respond_to?(:keys)
      process_response(response[keys[0]], keys[1..-1])
    end
  end
end
