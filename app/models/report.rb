class Report < ActiveRecord::Base
  validates :name, presence: true
  has_many :taxons, -> { order(:name) }, dependent: :destroy
  
  def add_taxon_name(name)
    # report = TaxonReporter.report(name)
    # print "report.taxons.length: #{report.taxons.length}\n"
    ids = EolData.get_eol_ids_from_name(name)
    ids.each {|id| add_eol_tree(id)} if ids
    self
  end
  
  def add_eol_tree(root_id, depth=0)
    raise "add_eol_tree: Going too deep" if depth > 10
    unless eol_id_index(root_id)
      taxon = add_taxon_by_eol_id(root_id)
      if taxon
        children = taxon.data('EolData', 'children')
        children.each do |child_id|
          add_eol_tree(child_id, depth+1)
        end
      end
    end
  end
      
  def add_taxon_by_eol_id(id)
    eol_data = EolData.data(id)
    if eol_data
      name = eol_data["scientificName"] ? eol_data["scientificName"].first : I18n.t('unknown_id', id: id)
      taxon = Taxon.new(:eol_id => id, :name => name)
      if taxon.valid?
        taxon.save
        taxon.add_data('EolData', eol_data)
        taxons << taxon
        taxon
      end
    end
  end

  def eol_id_index(id)
    taxons.index {|t| t.eol_id == id}
  end
  
  def fields; ["ranks", "richness"]; end
  
  def headers
    [I18n.t('taxa')] + fields.map{|f| I18n.t(f)}
  end
  
  def taxon_items(field=[], ascending=true)
    taxons.map { |t| [[t.name, "http://eol.org/#{t.eol_id}"]] + fields.map {|f| t.data("EolData", f).join(", ")} }
  end
  
  def data_dump
    taxons.map {|t| t.data_dump}.join(', ')
  end
end
