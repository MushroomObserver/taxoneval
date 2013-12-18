require 'spec_helper'

describe Report do
  it "has a valid factory" do
    FactoryGirl.create(:report).should be_valid
  end
  it "is invalid without a taxon" do
    FactoryGirl.build(:report, taxon: nil).should_not be_valid
  end
end
