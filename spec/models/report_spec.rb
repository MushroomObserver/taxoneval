require 'spec_helper'

describe Report do
  it "has a valid factory" do
    FactoryGirl.create(:report).should be_valid
  end
  it "is invalid without a taxon" do
    FactoryGirl.build(:report, taxon: nil).should_not be_valid
  end
  it "can find things in EOL" do
    FactoryGirl.build(:report, taxon: 'Gomphidiaceae').reports[:eol].should_not == nil
  end
end
