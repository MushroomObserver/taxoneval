require 'spec_helper'

{
  'http://eol.org/api/search/Gomphidiaceae.json?exact=t1' => {"results"=>[{"id"=>5955}]},
}.map {|url, response| SiteData.add_canned_response(url, response)}

describe SiteData do
  context "canned response" do
    let(:url) { "http://some.url" }
    let(:response) { "response" }
    it ".canned_response" do
      expect(SiteData.has_canned_response?(url)).to be_false
      expect(SiteData.canned_response(url)).to be_nil
      SiteData.add_canned_response(url, response)
      expect(SiteData.has_canned_response?(url)).to be_true
      expect(SiteData.canned_response(url)).to eq(response)
    end
  end

  it ".process_response" do
    expect(SiteData.process_response(1, [])).to eq(Set.new([1]))
    expect(SiteData.process_response("foo", [])).to eq(Set.new(["foo"]))
    expect(SiteData.process_response([1,2,3], [])).to eq(Set.new([1,2,3]))
    expect(SiteData.process_response({"a" => 1, "b" => 2, "c" => 3}, [])).to eq(Set.new([{"a" => 1, "b" => 2, "c" => 3}]))
    expect(SiteData.process_response(1, ["b"])).to be_nil
    expect(SiteData.process_response("foo", ["b"])).to be_nil
    expect(SiteData.process_response([1,2,3], ["b"])).to be_nil
    expect(SiteData.process_response([1,2,3], ["b"])).to be_nil
    expect(SiteData.process_response({"a" => 1, "b" => 2, "c" => 3}, ["b"])).to eq(Set.new([2]))
    expect(SiteData.process_response({"a" => 1, "b" => [{"x" => 1}, {"x" => 2}], "c" => 3}, ["b", "x"])).to eq(Set.new([1,2]))
    expect(SiteData.process_response([{"a" => 1, "b" => "x", "c" => "m"}, {"a" => 2, "b" => "y", "c" => "n"}],
      [["a", "c"]])).to eq(Set.new([[1, "m"], [2, "n"]]))
    expect(SiteData.process_response({
      "A" => [{"a" => 1, "b" => "x", "c" => "m"}, {"a" => 2, "b" => "y", "c" => "n"}],
      "B" => [{"a" => 3, "b" => "u", "c" => "o"}, {"a" => 4, "b" => "v", "c" => "p"}]
    }, ["A", ["a", "c"]])).to eq(Set.new([[1, "m"], [2, "n"]]))
  end
  
  it ".get_api_response" do
    expect(SiteData.get_api_response("http://eol.org/api/ping", true)).to_not be_nil
  end

  it ".get_with_print" do
    expect(SiteData.get_with_print("http://eol.org/api/ping")).to_not be_nil
  end
  
  it ".get_api_response with bad URL" do
    expect(SiteData.get_api_response("http://this.is.a.bad.url", true)).to be_nil
  end

  context "search/Gomphidiaceae" do
    let(:url) { "http://eol.org/api/search/Gomphidiaceae.json?exact=t1" }
    let(:path) { ["results", "id"] }

    it ".get_api_result" do
      expect(SiteData.get_api_result(url, path)).to eq(Set.new([5955]))
    end

    it ".get_api_results" do
      expect(SiteData.get_api_results(url,
             {"id" => path})).to eq({"id" => Set.new([5955])})
    end
  end
end
