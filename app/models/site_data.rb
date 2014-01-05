class SiteData
  @@canned_responses = {}
  
  def self.add_canned_response(url, response); @@canned_responses[url] = response; end
  def self.canned_response(url); @@canned_responses[url]; end
  def self.has_canned_response?(url); @@canned_responses.member?(url); end
  
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
  
  def self.get_api_response(url, ignore_testing=false)
    begin
      if Rails.env.test? and !ignore_testing
        has_canned_response?(url) ? canned_response(url) : get_with_print(url)
      else
        HTTParty.get(url)
      end
    rescue SocketError
      nil
    end
  end
  
  def self.get_with_print(url)
    result = HTTParty.get(url)
    print "'#{url}' => #{result},\n" 
    result
  end
  
  def self.process_response(response, keys)
    if response.class == Array
      results = Set.new
      response.each {|r|
        s = process_response(r, keys)
        results += s unless s.nil?
      }
      results.length == 0 ? nil : results
    elsif keys == []
      response ? Set.new([response]) : nil
    elsif response.respond_to?(:keys)
      key = keys[0]
      if key.class == Array
        Set.new([key.map {|k| response[k]}])
      else
        process_response(response[key], keys[1..-1])
      end
    end
  end
  
  def self.log(str)
    Rails.logger.debug(str)
    str
  end
end
