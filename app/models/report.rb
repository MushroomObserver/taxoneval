class Report < ActiveRecord::Base
  validates :taxon, presence: true
end
