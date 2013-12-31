class TaxonDatum < ActiveRecord::Base
  belongs_to :taxon
  
  def data_dump; "TaxonDatum: (#{id}) [report_type: #{report_type}, key: #{key}, value: #{value}]"; end
end
