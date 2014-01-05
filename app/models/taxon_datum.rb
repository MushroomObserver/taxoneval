class TaxonDatum < ActiveRecord::Base
  before_save :standardize_ranks
  belongs_to :taxon
  
  def data_dump; "TaxonDatum: (#{id}) [report_type: #{report_type}, key: #{key}, value: #{value}]"; end
  
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
  
  private
    PREFERRED_RANKS = ["Genus", "Species", "Subspecies", "Variety", "Form"]
  
    SHORT_RANKS = {
      'g' => 'Genus',
      'gen' => 'Genus',
      'sp' => 'Species',
      'subsp' => 'Subspecies',
      'v' => 'Variety',
      'var' => 'Variety',
      'f' => 'Form',
    }

    def standardize_ranks
      if self.key == 'ranks'
        unless PREFERRED_RANKS.member?(self.value)
          short_rank = value.split('.')[0].downcase
          self.value = SHORT_RANKS[short_rank] if SHORT_RANKS.member?(short_rank)
        end
      end
    end
end
