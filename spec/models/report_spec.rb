require 'spec_helper'

describe Report do
  it "has a valid factory" do
    FactoryGirl.create(:report).should be_valid
  end
  it "is invalid without a taxon name" do
    FactoryGirl.build(:report, name: nil).should_not be_valid
  end
end
