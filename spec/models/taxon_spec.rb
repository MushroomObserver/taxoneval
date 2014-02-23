require 'spec_helper'

describe Taxon do
  it "has a valid factory" do
    expect(FactoryGirl.create(:taxon)).to be_valid
  end
  
  it "is invalid without an eol_id" do
    expect(FactoryGirl.build(:taxon, eol_id: nil)).not_to be_valid
  end
  
  it "is invalid without a name" do
    expect(FactoryGirl.build(:taxon, name: nil)).not_to be_valid
  end
end
