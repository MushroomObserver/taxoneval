require 'spec_helper'

describe SiteData do
  it "acts like an empty hash" do
    sd = SiteData.new
    sd.keys.should == []
    sd[0].should == nil
  end
  it "processes responses" do
    sd = SiteData.new
    sd.process_response(1, []).should == 1
    sd.process_response("foo", []).should == "foo"
    sd.process_response([1,2,3], []).should == [1,2,3]
    sd.process_response({"a" => 1, "b" => 2, "c" => 3}, []).should == {"a" => 1, "b" => 2, "c" => 3}
    sd.process_response(1, ["b"]).should == nil
    sd.process_response("foo", ["b"]).should == nil
    sd.process_response([1,2,3], ["b"]).should == []
    sd.process_response([1,2,3], ["b"]).should == []
    sd.process_response({"a" => 1, "b" => 2, "c" => 3}, ["b"]).should == 2
    sd.process_response({"a" => 1, "b" => [{"x" => 1}, {"x" => 2}], "c" => 3}, ["b", "x"]).should == [1,2]
  end
  it "can get api responses" do
    sd = SiteData.new
    sd.get_api_result("http://eol.org/api/search/Gomphidiaceae.json?exact=t1", ["results", "id"]).should == [5955]
  end
  it "can deal with bad URLs" do
    sd = SiteData.new
    sd.get_api_result("http://this.is.a.bad.url", []).should == nil
  end
end
