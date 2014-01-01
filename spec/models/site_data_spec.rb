require 'spec_helper'

describe SiteData do
  it ".process_response" do
    expect(SiteData.process_response(1, [])).to eq([1])
    expect(SiteData.process_response("foo", [])).to eq(["foo"])
    expect(SiteData.process_response([1,2,3], [])).to eq([1,2,3])
    expect(SiteData.process_response({"a" => 1, "b" => 2, "c" => 3}, [])).to eq([{"a" => 1, "b" => 2, "c" => 3}])
    expect(SiteData.process_response(1, ["b"])).to be_nil
    expect(SiteData.process_response("foo", ["b"])).to be_nil
    expect(SiteData.process_response([1,2,3], ["b"])).to be_nil
    expect(SiteData.process_response([1,2,3], ["b"])).to be_nil
    expect(SiteData.process_response({"a" => 1, "b" => 2, "c" => 3}, ["b"])).to eq([2])
    expect(SiteData.process_response({"a" => 1, "b" => [{"x" => 1}, {"x" => 2}], "c" => 3}, ["b", "x"])).to eq([1,2])
  end
  
  it ".get_api_response with bad URL" do
    expect(SiteData.get_api_response("http://this.is.a.bad.url")).to be_nil
  end

  it ".get_api_results with bad EOL id" do
    expect(SiteData.get_api_results("http://eol.org/api/pages/0.json", {"eol_id" => ["identifier"]})).to eq({})
  end

  context "search/Gomphidiaceae" do
    let(:url) { "http://eol.org/api/search/Gomphidiaceae.json?exact=t1" }
    let(:path) { ["results", "id"] }

    it ".get_api_response" do
      expect(SiteData.get_api_response(url)).to_not be_nil
    end

    it ".get_api_result" do
      expect(SiteData.get_api_result(url, path)).to eq([5955])
    end

    it ".get_api_results" do
      expect(SiteData.get_api_results(url,
             {"id" => path})).to eq({"id" => [5955]})
    end
  end
end
