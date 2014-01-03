class TaxonDatum < ActiveRecord::Base
  belongs_to :taxon
  
  def data_dump; "TaxonDatum: (#{id}) [report_type: #{report_type}, key: #{key}, value: #{value}]"; end

  PREFERRED_RANKS = ["Genus", "Species", "Subspecies", "Variety", "Form"]
  
  COALESCING_KEYS = {
    "ranks" => :preferred_rank,
    "richness" => :richer
  }
  
  def preferred_rank(v1, v2)
    (v1.nil? or v1.index('.')) ? v2 : v1
  end
  
  def richer(v1, v2)
    v1.to_f > v2.to_f ? v1 : v2
  end

  def add_value(v)
    if COALESCING_KEYS.member?(self.key)
      self.value = self.send(COALESCING_KEYS[self.key], self.value, v)
      self.save
      true
    end
  end
end
