require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ReportsHelper. For example:
#
# describe ReportsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ReportsHelper do
  it ".link_to_text" do
    expect(link_or_text("Test")).to eq("Test")
    expect(link_or_text(["Test", "http://example.com"])).to eq("<a href=\"http://example.com\">Test</a>")
  end
end
