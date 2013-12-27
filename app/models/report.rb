class Report < ActiveRecord::Base
  validates :name, presence: true
  has_many :taxons
  
  def fields
    ["No Fields Yet"]
  end
end
