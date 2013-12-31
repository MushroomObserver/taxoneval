class SiteData
  def self.get_api_result(url, path); process_response(get_api_response(url), path); end
  
  def self.get_api_results(url, spec)
    response = get_api_response(url)
    if response
      result = {}
      spec.each do |key, path|
        value = process_response(response, path)
        result[key] = value if value
      end
      result
    end
  end
  
  def self.get_api_response(url)
    begin
      HTTParty.get(url)
    rescue SocketError
      nil
    end
  end
  
  def self.process_response(response, keys)
    if response.class == Array
      result = []
      response.each {|r|
        s = process_response(r, keys)
        result += s unless s.nil?
      }
      result == [] ? nil : result
    elsif keys == []
      response ? [response] : nil
    elsif response.respond_to?(:keys)
      process_response(response[keys[0]], keys[1..-1])
    end
  end
  
  def self.log(str)
    Rails.logger.debug(str)
    str
  end
end
