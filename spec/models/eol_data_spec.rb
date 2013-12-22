require 'spec_helper'

describe EolData do
  it "has a search url" do
    ed = EolData.new('Gomphidiaceae')
    ed.search_url.should == "http://eol.org/api/search/Gomphidiaceae.json?exact=1"
  end
  
  it "has an id" do
    ed = EolData.new('Gomphidiaceae')
    ed[:ids].should == [5955]
    ed[:urls].should == ["http://eol.org/5955"]
  end
end
