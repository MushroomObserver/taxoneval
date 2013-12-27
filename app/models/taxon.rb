class Taxon < ActiveRecord::Base
  belongs_to :report
  has_many :taxon_data
  
  def data(report_type, key)
    # TaxonDatum.find(:all, )
    []
  end
end
