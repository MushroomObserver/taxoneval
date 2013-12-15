require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "should not save report without taxon" do
    report = Report.new
    assert !report.save
  end

  test "should save report with a taxon" do
    report = Report.new
    report.taxon = "Gomphidiaceae"
    assert report.save
  end
end
