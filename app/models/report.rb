class Report < ActiveRecord::Base
  validates :taxon, presence: true
  
  def reports
    { :eol => EolData.new(taxon)}
  end
end
