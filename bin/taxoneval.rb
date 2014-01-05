#!/usr/bin/env ruby

ARGV.each do |name|
  report = Report.new(:name => name)
  if report.save
    report.add_taxon_name(report.name)
  end
end
